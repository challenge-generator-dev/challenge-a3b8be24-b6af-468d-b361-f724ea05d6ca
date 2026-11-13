import '../entities/pedido.dart';
import '../repositories/pedido_repository.dart';

class GetPedidos {
  final PedidoRepository repository;

  GetPedidos(this.repository);

  Future<List<Pedido>> call() async {
    try {
      final pedidos = await repository.getPedidos();
      return pedidos.where((pedido) => !pedido.isCancelado).toList();
    } on PedidoRepositoryException catch (e) {
      throw Exception('Error al obtener pedidos: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado al obtener pedidos: $e');
    }
  }
}

class FiltrarPedidos {
  List<Pedido> call(List<Pedido> pedidos, {String? estado}) {
    if (estado == null || estado.isEmpty) {
      return pedidos;
    }
    
    return pedidos.where((pedido) {
      if (estado == 'pendiente') {
        return pedido.isPendiente;
      } else if (estado == 'completado') {
        return pedido.isCompletado;
      } else if (estado == 'cancelado') {
        return pedido.isCancelado;
      }
      return true;
    }).toList();
  }
}

class ObtenerPedidoPorId {
  final PedidoRepository repository;

  ObtenerPedidoPorId(this.repository);

  Future<Pedido> call(String id) async {
    try {
      return await repository.getPedidoById(id);
    } on PedidoRepositoryException catch (e) {
      throw Exception('Error al obtener pedido: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado al obtener pedido: $e');
    }
  }
}

class ActualizarEstadoPedido {
  final PedidoRepository repository;

  ActualizarEstadoPedido(this.repository);

  Future<void> call(String id, String nuevoEstado) async {
    try {
      await repository.actualizarEstadoPedido(id, nuevoEstado);
    } on PedidoRepositoryException catch (e) {
      throw Exception('Error al actualizar estado: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado al actualizar estado: $e');
    }
  }
}

class CrearPedido {
  final PedidoRepository repository;

  CrearPedido(this.repository);

  Future<void> call(Pedido pedido) async {
    try {
      await repository.crearPedido(pedido);
    } on PedidoRepositoryException catch (e) {
      throw Exception('Error al crear pedido: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado al crear pedido: $e');
    }
  }
}