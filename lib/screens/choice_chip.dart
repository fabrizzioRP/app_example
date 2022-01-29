// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class ChoiceChipScreen extends StatefulWidget {
  @override
  State<ChoiceChipScreen> createState() => _ChoiceChipScreenState();
}

class _ChoiceChipScreenState extends State<ChoiceChipScreen> {
  bool isSelected = false, isSelectedNot = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choice Chip, Wrap & Expansion Tile'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Wrap(
            children: List.generate(
              foods.length,
              (i) => Chip(
                label: Text(foods[i]),
                avatar: const FlutterLogo(),
                onDeleted: () {},
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChip(
                avatar: const FlutterLogo(),
                label: const Text('Choice Chip 1'),
                selected: isSelected,
                onSelected: (value) {
                  debugPrint('Choice Chip 1');
                  setState(() {
                    isSelected = value;
                    isSelectedNot = !isSelected;
                  });
                },
              ),
              ChoiceChip(
                avatar: const FlutterLogo(),
                label: const Text('Choice Chip 2'),
                selected: isSelectedNot,
                onSelected: (value) {
                  debugPrint('Choice Chip 2');
                  setState(() {
                    isSelectedNot = value;
                    isSelected = !isSelectedNot;
                  });
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('See More'),
            leading: const Icon(Icons.info),
            children: [
              ListTile(title: const Text(parrafo), onTap: () {}),
              ListTile(title: const Text(parrafo), onTap: () {}),
              ListTile(title: const Text(parrafo), onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

const parrafo =
    'Elit laboris reprehenderit id eu sint deserunt proident duis pariatur aliquip excepteur.';

const List<String> foods = [
  'pizza',
  'hamburguesa',
  'milanesa',
  'chaufa',
  'ceviche',
  'pure'
];
