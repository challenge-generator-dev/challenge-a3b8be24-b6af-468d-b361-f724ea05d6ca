import '../entities/pedido.dart';

abstract class PedidoRepository {
  Future<List<Pedido>> getPedidos();
  Future<Pedido> getPedidoById(String id);
  Future<void> actualizarEstadoPedido(String id, String nuevoEstado);
  Future<void> crearPedido(Pedido pedido);
}

class PedidoRepositoryException implements Exception {
  final String message;
  PedidoRepositoryException(this.message);

  @override
  String toString() => 'PedidoRepositoryException: $message';
}