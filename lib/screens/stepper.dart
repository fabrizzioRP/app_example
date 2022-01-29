// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

const text =
    "Anim elit cupidatat veniam occaecat eu ipsum consectetur ex duis consectetur aute sit. Irure aute consectetur labore mollit velit incididunt dolor labore commodo laboris esse tempor exercitation. Do ex amet reprehenderit fugiat aliquip.";

class StepperScreen extends StatefulWidget {
  StepperScreen({Key? key}) : super(key: key);

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stepper(
          physics: const BouncingScrollPhysics(),
          currentStep: _currentStep,
          steps: const <Step>[
            Step(
              title: Text('Step 1'),
              content: Text(text),
            ),
            Step(
              title: Text('Step 2'),
              content: Text(text),
            ),
            Step(
              title: Text('Step 3'),
              content: Text(text),
            ),
          ],
          onStepTapped: (newIndex) {
            setState(() {
              _currentStep = newIndex;
            });
          },
          onStepContinue: () {
            if (_currentStep != 2) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }
}
