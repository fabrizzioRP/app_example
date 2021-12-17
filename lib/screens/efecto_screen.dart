// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, avoid_unnecessary_containers, curly_braces_in_flow_control_structure, curly_braces_in_flow_control_structures

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//
import 'package:app_examples/models/images_model.dart';

class Efecto3D extends StatefulWidget {
  @override
  State<Efecto3D> createState() => _Efecto3DState();
}

class _Efecto3DState extends State<Efecto3D> {
  List<ImagenesRandom> datos = [];
  Future<List<ImagenesRandom>> _loadData() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    final response = await http.get(url);
    datos = imagenesRandomFromJson(response.body);
    return datos;
  }

  final PageController controller =
      PageController(initialPage: 2, viewportFraction: 0.8);
  double currentIndex = 0.0;

  void _listener() => setState(() => currentIndex = controller.page!);

  @override
  void initState() {
    controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder(
          future: _loadData(),
          builder: (_, AsyncSnapshot<List<ImagenesRandom>> snapshot) {
            if (!snapshot.hasData)
              return Container(
                  child: Center(child: CircularProgressIndicator()));

            final List<ImagenesRandom> data = snapshot.data!;

            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: PageView.builder(
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (_, i) {
                    //(' pagina actual :   $currentIndex');
                    final percent = currentIndex - i;
                    final value = percent.clamp(0.0, 1.0);
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Opacity(
                        opacity: 1 - value,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..scale(value + 1 * percent + 1),
                          //..rotateX(math.pi * value),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/meta.png'),
                            image: NetworkImage(data[i].url),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'HeroBackButtom',
          child: Icon(Icons.home),
          onPressed: () => Navigator.pop(context),
        ),
      );
}
