import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  double _montoTotal = 0.00;
  List<OrderDetails> _detalle = [];

  get montoTotal {
    _montoTotal = _detalle.fold(
        0, (previousValue, element) => previousValue + element._subtotal);
    return _montoTotal;
  }

  get detalle {
    return _detalle;
  }

  set detalle(OrderDetails detalle) {
    _detalle.add(detalle);
    notifyListeners();
  }

  void vaciarCarrito() {
    _detalle.clear();
    notifyListeners();
  }
}

// class Order {
//   double _montoTotal = 0.00;
//   List<OrderDetails> detalle = List<OrderDetails>();
//   get montoTotal {
//     return _montoTotal;
//   }

//   set montoTotal(double montoTotal) {
//     this._montoTotal = montoTotal;
//   }
// }

class OrderDetails {
  String _nombreProducto;
  int _cantidad;
  double _precio;
  double _subtotal;

  get nombreProducto {
    return _nombreProducto;
  }

  get cantidad {
    return _cantidad;
  }

  get precio {
    return _precio;
  }

  get subtotal {
    return _subtotal;
  }

  set nombreProducto(String nombreProducto) {
    this._nombreProducto = nombreProducto;
  }

  set cantidad(int cantidad) {
    this._cantidad = cantidad;
  }

  set precio(double precio) {
    this._precio = precio;
  }

  set subtotal(double subtotal) {
    this._subtotal = subtotal;
  }
}
