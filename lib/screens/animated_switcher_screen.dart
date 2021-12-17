// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields, unused_field

import 'package:flutter/material.dart';

class AnimatedSwitcherScreen extends StatefulWidget {
  @override
  State<AnimatedSwitcherScreen> createState() => _AnimatedSwitcherScreenState();
}

class _AnimatedSwitcherScreenState extends State<AnimatedSwitcherScreen> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Animated Switcher Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            duration: Duration(milliseconds: 500),
            child: Container(
              key: ValueKey(_count),
              color: listColors[_count],
              width: size.width,
              height: size.height * 0.7,
              child: Center(child: Text('N° $_count')),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            elevation: 0,
            child: Icon(Icons.add),
            onPressed: () => setState(() {
              _count++;
              if (_count >= listColors.length) _count = 0;
            }),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'HeroBackButtom',
            elevation: 0,
            child: Icon(Icons.home),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

List<Color?> listColors = [
  Colors.red,
  Colors.black,
  Colors.yellow,
  Colors.green,
  Colors.purple,
  Colors.blue,
];
