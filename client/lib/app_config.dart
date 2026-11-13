import 'package:dio/dio.dart';

class AppConfig {
  static const String appName = 'Reto App';
  static const String appVersion = '1.0.0';

  static const String baseUrl = 'http://load_balancer_dns';
  static const String apiPath = '/api';

  static const String pedidosEndpoint = '/pedidos';

  static String get fullApiUrl => '$baseUrl$apiPath';
  static String get pedidosUrl => '$fullApiUrl$pedidosEndpoint';

  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  static const int pageSize = 20;
  static const int maxPageSize = 100;

  static const String ambienteDesarrollo = 'development';
  static const String ambienteProduccion = 'production';
  static const String ambientePrueba = 'test';

  static String currentEnvironment = ambienteDesarrollo;

  static bool get isDevelopment => currentEnvironment == ambienteDesarrollo;
  static bool get isProduction => currentEnvironment == ambienteProduccion;
  static bool get isTest => currentEnvironment == ambientePrueba;

  static void setEnvironment(String environment) {
    if (environment == ambienteDesarrollo ||
        environment == ambienteProduccion ||
        environment == ambientePrueba) {
      currentEnvironment = environment;
    } else {
      throw ArgumentError('Ambiente no válido: $environment');
    }
  }

  static Dio createDioInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl: fullApiUrl,
        connectTimeout: connectionTimeout,
        receiveTimeout: receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      _LoggingInterceptor(),
      _RetryInterceptor(
        maxRetries: maxRetries,
        retryDelay: retryDelay,
      ),
    ]);

    return dio;
  }

  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Map<String, dynamic> get apiConfig => {
    'baseUrl': baseUrl,
    'apiPath': apiPath,
    'endpoints': {
      'pedidos': pedidosEndpoint,
    },
    'timeouts': {
      'connection': connectionTimeout.inSeconds,
      'receive': receiveTimeout.inSeconds,
    },
    'retry': {
      'maxRetries': maxRetries,
      'delaySeconds': retryDelay.inSeconds,
    },
    'pagination': {
      'defaultPageSize': pageSize,
      'maxPageSize': maxPageSize,
    },
    'environment': currentEnvironment,
  };

  static void printConfig() {
    print('=== Configuración de la Aplicación ===');
    print('Nombre: $appName');
    print('Versión: $appVersion');
    print('Ambiente: $currentEnvironment');
    print('URL Base: $baseUrl');
    print('URL API: $fullApiUrl');
    print('Endpoint Pedidos: $pedidosUrl');
    print('Timeout Conexión: ${connectionTimeout.inSeconds}s');
    print('Timeout Recepción: ${receiveTimeout.inSeconds}s');
    print('Máximo de Reintentos: $maxRetries');
    print('======================================');
  }
}

class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('┌─────────────────────────────────────────');
    print('│ REQUEST: ${options.method} ${options.uri}');
    print('│ Headers: ${options.headers}');
    if (options.data != null) {
      print('│ Body: ${options.data}');
    }
    print('└─────────────────────────────────────────');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('┌─────────────────────────────────────────');
    print('│ RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
    print('│ Data: ${response.data}');
    print('└─────────────────────────────────────────');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('┌─────────────────────────────────────────');
    print('│ ERROR: ${err.type}');
    print('│ Message: ${err.message}');
    print('│ URI: ${err.requestOptions.uri}');
    if (err.response != null) {
      print('│ Status: ${err.response?.statusCode}');
      print('│ Response: ${err.response?.data}');
    }
    print('└─────────────────────────────────────────');
    handler.next(err);
  }
}

class _RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration retryDelay;

  _RetryInterceptor({
    required this.maxRetries,
    required this.retryDelay,
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;
    final retryCount = requestOptions.extra['retryCount'] ?? 0;

    if (_shouldRetry(err) && retryCount < maxRetries) {
      await Future.delayed(retryDelay);

      requestOptions.extra['retryCount'] = retryCount + 1;

      try {
        final dio = Dio();
        final response = await dio.fetch(requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        handler.next(err);
        return;
      }
    }

    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
           err.type == DioExceptionType.sendTimeout ||
           err.type == DioExceptionType.receiveTimeout ||
           err.type == DioExceptionType.connectionError ||
           (err.response?.statusCode != null &&
            err.response!.statusCode! >= 500);
  }
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';

  factory ApiException.fromDioException(DioException e) {
    String message;
    int? statusCode = e.response?.statusCode;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Tiempo de conexión agotado';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Tiempo de envío agotado';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Tiempo de recepción agotado';
        break;
      case DioExceptionType.badResponse:
        message = _parseErrorMessage(e.response?.data);
        statusCode = e.response?.statusCode;
        break;
      case DioExceptionType.cancel:
        message = 'Solicitud cancelada';
        break;
      case DioExceptionType.connectionError:
        message = 'Error de conexión';
        break;
      default:
        message = e.message ?? 'Error desconocido';
    }

    return ApiException(
      message: message,
      statusCode: statusCode,
      data: e.response?.data,
    );
  }

  static String _parseErrorMessage(dynamic data) {
    if (data == null) return 'Error desconocido';
    if (data is Map) {
      return data['message'] ?? data['error'] ?? data.toString();
    }
    return data.toString();
  }
}

class NetworkInfo {
  static const String networkError = 'Error de red';
  static const String timeoutError = 'Tiempo de espera agotado';
  static const String serverError = 'Error del servidor';
  static const String unauthorizedError = 'No autorizado';
  static const String forbiddenError = 'Acceso prohibido';
  static const String notFoundError = 'Recurso no encontrado';
  static const String validationError = 'Error de validación';
  static const String unknownError = 'Error desconocido';

  static String getErrorMessage(DioException e) {
    if (e.response?.statusCode != null) {
      final statusCode = e.response!.statusCode!;
      if (statusCode == 401) return unauthorizedError;
      if (statusCode == 403) return forbiddenError;
      if (statusCode == 404) return notFoundError;
      if (statusCode >= 400 && statusCode < 500) return validationError;
      if (statusCode >= 500) return serverError;
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return timeoutError;
      case DioExceptionType.connectionError:
        return networkError;
      default:
        return unknownError;
    }
  }
}