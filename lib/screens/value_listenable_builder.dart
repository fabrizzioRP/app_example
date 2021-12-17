// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'dart:math';
import 'package:flutter/material.dart';

class ValueListenableBuilderScreen extends StatefulWidget {
  @override
  _ValueListenableBuilderScreenState createState() =>
      _ValueListenableBuilderScreenState();
}

class _ValueListenableBuilderScreenState
    extends State<ValueListenableBuilderScreen> {
  var changeMode = ValueNotifier(false);
  var rot = ValueNotifier(0);

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: changeMode,
        builder: (context, mode, child) => Scaffold(
          backgroundColor: (changeMode.value)
              ? ThemeData.dark().scaffoldBackgroundColor
              : ThemeData.light().scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: (changeMode.value)
                ? ThemeData.dark().primaryColor
                : ThemeData.light().primaryColor,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('Value Listenable Builder'),
          ),
          body: ValueListenableBuilder(
            valueListenable: rot,
            child: Center(child: _getContainer()),
            builder: (context, n, child) => Transform.rotate(
              angle: (rot.value * (pi / 180)),
              child: child!,
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30),
              FloatingActionButton(
                heroTag: 'ChangeValueRot',
                backgroundColor: (changeMode.value)
                    ? Color(0xff32ae85)
                    : ThemeData.light().primaryColor,
                child: Icon(Icons.rotate_right),
                onPressed: () {
                  rot.value += 30;
                  if (rot.value >= 180) rot.value = 0;
                },
              ),
              SizedBox(width: 100),
              FloatingActionButton(
                heroTag: 'HeroBackButtom',
                backgroundColor: (changeMode.value)
                    ? Color(0xff32ae85)
                    : ThemeData.light().primaryColor,
                child: Icon(Icons.home),
                onPressed: () => Navigator.pop(context),
              ),
              Spacer(),
              FloatingActionButton(
                heroTag: 'ThemeMode',
                backgroundColor: (changeMode.value)
                    ? Color(0xff32ae85)
                    : ThemeData.light().primaryColor,
                child: Icon(Icons.dark_mode_outlined),
                onPressed: () => changeMode.value = !changeMode.value,
              ),
            ],
          ),
        ),
      );

  Container _getContainer() => Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(color: Colors.blue),
      );
}
