class Pedido {
  final String id;
  final String producto;
  final int cantidad;
  final String estado;

  const Pedido({
    required this.id,
    required this.producto,
    required this.cantidad,
    required this.estado,
  });

  bool get isPendiente => estado == 'pendiente';
  bool get isCompletado => estado == 'completado';
  bool get isCancelado => estado == 'cancelado';

  Pedido copyWith({
    String? id,
    String? producto,
    int? cantidad,
    String? estado,
  }) {
    return Pedido(
      id: id ?? this.id,
      producto: producto ?? this.producto,
      cantidad: cantidad ?? this.cantidad,
      estado: estado ?? this.estado,
    );
  }

  Pedido copyWithEstado(String nuevoEstado) {
    return copyWith(estado: nuevoEstado);
  }

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'] as String? ?? '',
      producto: json['producto'] as String? ?? '',
      cantidad: json['cantidad'] is int 
          ? json['cantidad'] as int 
          : int.tryParse(json['cantidad']?.toString() ?? '0') ?? 0,
      estado: json['estado'] as String? ?? 'pendiente',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'producto': producto,
      'cantidad': cantidad,
      'estado': estado,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'producto': producto,
      'cantidad': cantidad,
      'estado': estado,
    };
  }

  @override
  String toString() {
    return 'Pedido(id: $id, producto: $producto, cantidad: $cantidad, estado: $estado)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Pedido &&
        other.id == id &&
        other.producto == producto &&
        other.cantidad == cantidad &&
        other.estado == estado;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        producto.hashCode ^
        cantidad.hashCode ^
        estado.hashCode;
  }
}