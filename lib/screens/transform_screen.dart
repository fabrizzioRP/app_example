// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:math' as math;
import 'package:flutter/material.dart';

class TransformScreen extends StatefulWidget {
  @override
  _TransformScreenState createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 100,
            ),
            // Transform.scale(
            //   scale: _value * 2.0,
            //   child: Image.asset('assets/meta.png', height: 100),
            // ),
            // Transform.translate(
            //   offset: Offset(-_value * 30, -_value * 30),
            //   child: Image.asset('assets/meta.png', height: 100),
            // ),
            // Transform.rotate(
            //   angle: _value * Math.pi * 2,
            //   child: Image.asset('assets/meta.png', height: 100),
            // ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(math.pi * _value),
              child: Image.asset('assets/zapatillas/logo1.png', height: 300),
            ),
            Slider(
              value: _value,
              onChanged: (value) => setState(() => _value = value),
            ),
            Text(' Value : ${_value.toStringAsFixed(1)}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'HeroBackButtom',
        child: Icon(Icons.home),
        onPressed: () => Navigator.pop(context),
      ));
}
