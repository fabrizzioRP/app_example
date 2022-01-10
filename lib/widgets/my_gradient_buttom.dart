// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyGradientElevatedButtom extends StatelessWidget {
  final double witdh;
  final double height;
  final String text;
  final double border;
  final VoidCallback onPressed;

  MyGradientElevatedButtom({
    this.witdh = 150,
    this.height = 50,
    this.border = 10,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: witdh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border),
        gradient: const LinearGradient(
          colors: [
            Color(0xfff12711),
            Color(0xfff5af19),
          ],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
