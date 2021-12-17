// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

const String text =
    "Deserunt in consectetur Lorem commodo deserunt. Ad Lorem anim minim pariatur. Cupidatat exercitation commodo id aliquip magna ut nisi voluptate nisi sint aute aliquip. Culpa ex sint cillum cupidatat magna adipisicing aliqua magna deserunt do officia deserunt. Consequat ea aliqua magna do commodo in do consequat. Veniam eu quis excepteur reprehenderit irure sint reprehenderit ut tempor fugiat. Do nulla enim ipsum velit eiusmod elit dolore non dolor cillum consequat.";

class TweenAnimationBuilderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: TweenAnimationBuilder(
        curve: Curves.bounceIn,
        duration: Duration(seconds: 1),
        tween: Tween(begin: 0.0, end: 1.0),
        child: Center(child: Text(text)),
        builder: (_, valor, widget) => Transform(
          transform: Matrix4.identity()
            ..translate(-400 * double.parse(valor.toString()) + 400)
            ..translate(0.0, -200 * double.parse(valor.toString())), // x , y
          alignment: Alignment.center,
          child: widget!,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: 'HeroBackButtom',
          child: Icon(Icons.home),
          onPressed: () => Navigator.pop(context)));
}
