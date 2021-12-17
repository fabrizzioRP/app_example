import 'package:flutter/material.dart';

class Producto {
  int id;
  double precio;
  Color background;
  String? heroid;
  String nombre, categoria, portadaUrlImg;

  Producto({
    required this.id,
    required this.precio,
    required this.nombre,
    required this.categoria,
    required this.background,
    required this.portadaUrlImg,
  });

  @override
  String toString() =>
      ' id : $id  - nombre : $nombre - precio : $precio - categoria : $categoria';
}

class Stocks {
  List<Producto> stocks = [];

  Stocks(this.stocks) {
    stocks = stocks;
  }

  add(Producto producto) {
    stocks.add(producto);
    return 'add : ${producto.nombre} - ${producto.id}';
  }

  remove(int id) {
    stocks.map((producto) {
      if (producto.id == id) {
        stocks.removeWhere((element) => element.id == id);
        return 'remove : ${producto.id} - ${producto.nombre}';
      } else {
        return 'The list have not this id';
      }
    });
  }

  isExist(int id) {
    int value = stocks.indexWhere((item) => item.id == id);
    return value;
  }

  readOne(int indice) => stocks[indice];

  readAll() => stocks.map((item) => item.toString());

  size() => stocks.length;
}
