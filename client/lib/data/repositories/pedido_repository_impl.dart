import 'package:dio/dio.dart';
import '../../domain/entities/pedido.dart';
import '../../domain/repositories/pedido_repository.dart';
import '../datasources/api_datasource.dart';

class PedidoRepositoryImpl implements PedidoRepository {
  final ApiDataSource apiDataSource;
  final Dio dio;

  PedidoRepositoryImpl({
    required this.apiDataSource,
    required this.dio,
  }) {
    if (apiDataSource.dio != dio) {
      throw PedidoRepositoryException(
        'El objeto Dio proporcionado no coincide con el de ApiDataSource',
      );
    }
  }

  @override
  Future<List<Pedido>> getPedidos() async {
    try {
      final pedidosData = await apiDataSource.fetchPedidos();
      return pedidosData;
    } on DioException catch (e) {
      final mensaje = _mapearErrorDio(e);
      throw PedidoRepositoryException(mensaje);
    } catch (e) {
      if (e is PedidoRepositoryException) {
        rethrow;
      }
      throw PedidoRepositoryException('Error al obtener pedidos: $e');
    }
  }

  @override
  Future<Pedido> getPedidoById(String id) async {
    if (id.isEmpty) {
      throw PedidoRepositoryException('El ID del pedido no puede estar vacío');
    }
    try {
      final pedido = await apiDataSource.fetchPedidoById(id);
      return pedido;
    } on DioException catch (e) {
      final mensaje = _mapearErrorDio(e);
      throw PedidoRepositoryException(mensaje);
    } catch (e) {
      if (e is PedidoRepositoryException) {
        rethrow;
      }
      throw PedidoRepositoryException('Error al obtener el pedido: $e');
    }
  }

  @override
  Future<void> actualizarEstadoPedido(String id, String nuevoEstado) async {
    if (id.isEmpty) {
      throw PedidoRepositoryException('El ID del pedido no puede estar vacío');
    }
    if (!_esEstadoValido(nuevoEstado)) {
      throw PedidoRepositoryException('El estado "$nuevoEstado" no es válido');
    }
    try {
      await apiDataSource.actualizarEstado(id, nuevoEstado);
    } on DioException catch (e) {
      final mensaje = _mapearErrorDio(e);
      throw PedidoRepositoryException(mensaje);
    } catch (e) {
      if (e is PedidoRepositoryException) {
        rethrow;
      }
      throw PedidoRepositoryException('Error al actualizar el estado: $e');
    }
  }

  @override
  Future<void> crearPedido(Pedido pedido) async {
    if (pedido.id.isEmpty) {
      throw PedidoRepositoryException('El ID del pedido no puede estar vacío');
    }
    if (pedido.producto.isEmpty) {
      throw PedidoRepositoryException('El producto no puede estar vacío');
    }
    if (pedido.cantidad <= 0) {
      throw PedidoRepositoryException('La cantidad debe ser mayor a 0');
    }
    try {
      await apiDataSource.actualizarEstado(pedido.id, pedido.estado);
    } on DioException catch (e) {
      final mensaje = _mapearErrorDio(e);
      throw PedidoRepositoryException(mensaje);
    } catch (e) {
      if (e is PedidoRepositoryException) {
        rethrow;
      }
      throw PedidoRepositoryException('Error al crear el pedido: $e');
    }
  }

  String _mapearErrorDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Tiempo de conexión agotado';
      case DioExceptionType.sendTimeout:
        return 'Tiempo de envío agotado';
      case DioExceptionType.receiveTimeout:
        return 'Tiempo de recepción agotado';
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final mensaje = e.response?.data?['message'] ?? 'Error desconocido';
        return 'Error del servidor ($statusCode): $mensaje';
      case DioExceptionType.cancel:
        return 'Solicitud cancelada';
      case DioExceptionType.connectionError:
        return 'Error de conexión: verifica tu conexión a internet';
      case DioExceptionType.unknown:
      default:
        return 'Error de red: ${e.message ?? 'Error desconocido'}';
    }
  }

  bool _esEstadoValido(String estado) {
    const estadosValidos = ['pendiente', 'completado', 'cancelado'];
    return estadosValidos.contains(estado.toLowerCase());
  }

  List<Pedido> filtrarPorEstado(List<Pedido> pedidos, String? estado) {
    if (estado == null || estado.isEmpty) {
      return pedidos;
    }
    return pedidos.where((p) => p.estado.toLowerCase() == estado.toLowerCase()).toList();
  }

  List<Pedido> ordenarPorFecha(List<Pedido> pedidos, {bool descendente = false}) {
    final listaOrdenada = List<Pedido>.from(pedidos);
    listaOrdenada.sort((a, b) => descendente ? b.id.compareTo(a.id) : a.id.compareTo(b.id));
    return listaOrdenada;
  }

  Map<String, int> agruparPorEstado(List<Pedido> pedidos) {
    final mapa = <String, int>{};
    for (final pedido in pedidos) {
      mapa[pedido.estado] = (mapa[pedido.estado] ?? 0) + 1;
    }
    return mapa;
  }

  int calcularTotalCantidad(List<Pedido> pedidos) {
    return pedidos.fold(0, (suma, pedido) => suma + pedido.cantidad);
  }

  List<Pedido> buscarPorProducto(List<Pedido> pedidos, String termino) {
    if (termino.isEmpty) return pedidos;
    final lowerTermino = termino.toLowerCase();
    return pedidos.where((p) => p.producto.toLowerCase().contains(lowerTermino)).toList();
  }
}