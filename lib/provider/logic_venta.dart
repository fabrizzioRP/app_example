// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//
import 'package:app_examples/models/productos.dart';

class LogicVenta extends ChangeNotifier {
  final products = Stocks(_items);

  List<Producto> carritoCompra = [];

  LogicVenta() {
    print('Provider Inicializado');
  }

  addStock(Producto producto) {
    if (products.isExist(producto.id) == -1) {
      products.add(producto);
      notifyListeners();
      return producto.toString();
    } else {
      return 'Lo sentimos este producto ya a sido agregado!';
    }
  }

  List<Producto> initSale(Producto producto) {
    carritoCompra.add(producto);
    notifyListeners();
    return carritoCompra;
  }

  isProductAdded(int id) {
    final value = carritoCompra.indexWhere((item) {
      if (item.id == id) return true;
      return false;
    });
    return value;
  }

  double precioItems() {
    double costofinal = 0;

    if (carritoCompra.isNotEmpty) {
      carritoCompra.forEach((item) {
        costofinal += item.precio;
      });
      return costofinal;
    }

    return 0;
  }

  clearCar() => carritoCompra.clear();
}

List<Producto> _items = [
  Producto(
      id: 1,
      precio: 100.000,
      nombre: 'Air Jordan Orange',
      categoria: 'calzados',
      background: Colors.orangeAccent,
      portadaUrlImg: '1.png'),
  Producto(
      id: 2,
      precio: 160.000,
      nombre: 'Air Jordan Red',
      categoria: 'calzados',
      background: Colors.redAccent,
      portadaUrlImg: '2.png'),
  Producto(
      id: 3,
      precio: 300.000,
      nombre: 'Air Jordan Energy Psychic',
      categoria: 'calzados',
      background: Colors.yellow.shade600,
      portadaUrlImg: '3.png'),
  Producto(
      id: 4,
      precio: 200.000,
      nombre: 'Air Jordan Force Nike',
      categoria: 'calzados',
      background: Colors.green.shade200,
      portadaUrlImg: '4.png'),
  Producto(
      id: 5,
      precio: 500.000,
      nombre: 'Air Jordan Max Retro Style',
      categoria: 'calzados',
      background: Colors.orange.shade100,
      portadaUrlImg: '5.png'),
  Producto(
      id: 6,
      precio: 340.990,
      nombre: 'Air Jordan Style Fresh',
      categoria: 'calzados',
      background: Colors.black54,
      portadaUrlImg: '6.png'),
  Producto(
      id: 7,
      precio: 740.990,
      nombre: 'Yeezy Sply-350',
      categoria: 'calzados',
      background: Colors.orange.shade900,
      portadaUrlImg: '7.png'),
  Producto(
      id: 8,
      precio: 440.990,
      nombre: 'Air Force One White',
      categoria: 'calzados',
      background: Colors.white,
      portadaUrlImg: '8.png'),
  Producto(
      id: 9,
      precio: 500.000,
      nombre: 'Adidas',
      categoria: 'calzados',
      background: Colors.green.shade200,
      portadaUrlImg: '9.png'),
  Producto(
      id: 10,
      precio: 50.990,
      nombre: 'Vans Classic',
      categoria: 'calzados',
      background: Colors.white,
      portadaUrlImg: '10.png'),
];
