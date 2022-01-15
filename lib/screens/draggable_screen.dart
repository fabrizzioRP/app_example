// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DraggableScreen extends StatefulWidget {
  @override
  State<DraggableScreen> createState() => _DraggableScreenState();
}

class _DraggableScreenState extends State<DraggableScreen> {
  bool insideTarget = false;
  String activeFruit = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Drag and Drop'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Inside Target? ' + insideTarget.toString()),
            DragTarget<String>(
              builder: (_, list, rejectData) => Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.blue,
                  child: activeFruit == ''
                      ? null
                      : _FruitBox(activeFruit, Colors.blue)),
              onAccept: (value) {
                setState(() {
                  insideTarget = true;
                  activeFruit = value;
                });
              },
              onWillAccept: (value) {
                return value == 'platano' ? true : false;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _FruitBox('Manzana', Colors.red),
                _FruitBox('platano', Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FruitBox extends StatelessWidget {
  final String boxIcon;
  final Color boxColor;
  const _FruitBox(this.boxIcon, this.boxColor);
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: boxIcon,
      child: Container(
        height: 120.0,
        width: 120.0,
        color: boxColor,
        child: Center(
          child: Text(boxIcon, style: const TextStyle(fontSize: 20)),
        ),
      ),
      feedback: Material(
        child: Container(
          height: 120.0,
          width: 120.0,
          color: Colors.yellow,
          child: Center(
            child: Text(boxIcon, style: const TextStyle(fontSize: 20)),
          ),
        ),
      ),
      childWhenDragging: Container(
        height: 120.0,
        width: 120.0,
        color: Colors.grey,
      ),
    );
  }
}
