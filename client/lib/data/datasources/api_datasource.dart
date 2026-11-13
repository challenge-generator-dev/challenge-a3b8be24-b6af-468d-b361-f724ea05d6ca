import 'package:dio/dio.dart';
import '../../domain/entities/pedido.dart';
import '../../domain/repositories/pedido_repository.dart';

class ApiDataSource {
  final Dio dio;

  ApiDataSource({required this.dio});

  Future<List<Pedido>> fetchPedidos() async {
    try {
      final response = await dio.get('/pedidos');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Pedido.fromJson(json)).toList();
      } else {
        throw PedidoRepositoryException(
            'Error al obtener pedidos: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw PedidoRepositoryException(
            'Error en la respuesta: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        throw PedidoRepositoryException(
            'Error de conexión: ${e.message}');
      }
    } catch (e) {
      throw PedidoRepositoryException('Error inesperado: $e');
    }
  }

  Future<Pedido> fetchPedidoById(String id) async {
    try {
      final response = await dio.get('/pedidos/$id');
      if (response.statusCode == 200) {
        return Pedido.fromJson(response.data);
      } else {
        throw PedidoRepositoryException(
            'Error al obtener pedido: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw PedidoRepositoryException(
          'Error al obtener pedido: ${e.message}');
    }
  }

  Future<void> actualizarEstado(String id, String nuevoEstado) async {
    try {
      final response = await dio.patch(
        '/pedidos/$id/estado',
        data: {'estado': nuevoEstado},
      );
      if (response.statusCode != 200) {
        throw PedidoRepositoryException(
            'Error al actualizar estado: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw PedidoRepositoryException(
          'Error al actualizar estado: ${e.message}');
    }
  }
}