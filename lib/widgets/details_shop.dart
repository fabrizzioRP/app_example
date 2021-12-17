// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:flutter/widgets.dart';
import 'package:app_examples/models/productos.dart';
import 'package:app_examples/provider/logic_venta.dart';

class DetailsShopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final consumeProvider = Provider.of<LogicVenta>(context);
    final data = ModalRoute.of(context)!.settings.arguments as Producto;
    return Scaffold(
      body: Stack(
        children: [
          // Boton de retroceso :
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new,
                  size: 35, color: data.background),
            ),
          ),
          // Efecto del fondo :
          Positioned(
            top: -50,
            left: size.width * 0.1,
            right: -50,
            child: Transform.rotate(
              angle: 0.6,
              child: Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: data.background,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200.0),
                        bottomRight: Radius.circular(200.0)),
                  )),
            ),
          ),
          // La Imagen de la zapatilla :
          Positioned(
            top: size.height * 0.07,
            right: -20,
            left: -20,
            child: Hero(
              tag: data.heroid!,
              child: Transform.rotate(
                angle: 6.0,
                child: Image.asset('assets/zapatillas/${data.portadaUrlImg}',
                    height: 340),
              ),
            ),
          ),
          // Los detalles de la zapatilla :
          Positioned(
            top: size.height * 0.4,
            left: 0,
            right: 0,
            bottom: size.height * 0.4,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    data.nombre,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 30),
                  Text(
                    '\$${data.precio.toString()}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          // Botones de compra :
          Positioned(
            bottom: 30,
            left: 10,
            right: size.width * 0.025,
            child: GestureDetector(
              onTap: () {
                if (consumeProvider.isProductAdded(data.id) == -1) {
                  consumeProvider.initSale(data);
                } else {
                  print('Elemento ya esta en el carrito de compra!!');
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  color: data.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Add',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: (data.background == Colors.white)
                            ? Colors.black
                            : Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
