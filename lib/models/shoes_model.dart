import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shoes {
  int id;
  String name;
  double precio;
  String descripcion;
  String image;
  List<Color> colores;
  List<int> talla;

  Shoes(this.id, this.name, this.precio, this.descripcion, this.image,
      this.colores, this.talla);
}

List<Shoes> shoes = [
  Shoes(
    1,
    'Nike Blazer Mid Vintage',
    120.000,
    parrafo,
    'https://fondosmil.com/fondo/87621.jpg',
    [Colors.black, Colors.green, Colors.orange, Colors.purple, Colors.pink],
    [38, 39, 40, 41, 42],
  ),
  Shoes(
    2,
    'Nike Blazer Mid Vintage',
    120.000,
    parrafo,
    'https://i.pinimg.com/736x/64/ad/7e/64ad7ef79142a0122169a54dd366f560--nike-leggings-nike-sweatpants.jpg',
    [Colors.black, Colors.green, Colors.orange, Colors.purple, Colors.pink],
    [38, 39, 40, 41, 42],
  ),
  Shoes(
    3,
    'Nike Blazer Mid Vintage',
    120.000,
    parrafo,
    'https://www.wallpapertip.com/wmimgs/1-18812_hypebeast-wallpapers-nixxboi-sneaker-wallpaper-iphone.jpg',
    [Colors.black, Colors.green, Colors.orange, Colors.purple, Colors.pink],
    [38, 39, 40, 41, 42],
  ),
  Shoes(
    4,
    'Nike Blazer Mid Vintage',
    120.000,
    parrafo,
    'https://fondosmil.com/fondo/87601.jpg',
    [Colors.black, Colors.green, Colors.orange, Colors.purple, Colors.pink],
    [38, 39, 40, 41, 42],
  ),
];

const parrafo =
    "Est cillum pariatur ea dolor amet proident adipisicing. Ut sint veniam sunt pariatur culpa incididunt commodo et laboris excepteur. Pariatur exercitation adipisicing deserunt Lorem. Do ut enim enim excepteur aute veniam esse do anim esse anim laborum dolore sit. Magna mollit in velit officia duis. Qui veniam do eiusmod est ex. Aute commodo anim pariatur pariatur fugiat ex voluptate.";
