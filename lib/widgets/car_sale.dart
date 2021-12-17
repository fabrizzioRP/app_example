// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:app_examples/models/productos.dart';
import 'package:app_examples/provider/logic_venta.dart';

class CarSaleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List<Producto>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Sale'),
        centerTitle: true,
      ),
      body: (data.isEmpty) ? _NoBuyingDetails() : _BuyingDetails(data: data),
    );
  }
}

class _NoBuyingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(Icons.error, size: 80, color: Colors.red),
            Text('Lo sentimos el carrito esta vacío',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w300,
                    fontSize: 22)),
          ],
        ),
      ),
    );
  }
}

class _BuyingDetails extends StatefulWidget {
  final List<Producto> data;

  const _BuyingDetails({required this.data});

  @override
  State<_BuyingDetails> createState() => _BuyingDetailsState();
}

class _BuyingDetailsState extends State<_BuyingDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> opacity;
  late Animation<double> scale;

  void initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    opacity = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.4)));

    scale = Tween(begin: 0.0, end: 5.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.bounceIn)));

    _controller.forward();
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final consumProvider = Provider.of<LogicVenta>(context);
    final preciofinal = consumProvider.precioItems().toString();
    return Column(
      children: [
        // Items :
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: widget.data.length,
            itemBuilder: (_, i) {
              final producto = widget.data[i];
              return _ItemsDetails(producto: producto);
            },
          ),
        ),
        // Boton de confirmar :
        AnimatedOpacity(
          opacity: opacity.value,
          duration: Duration(milliseconds: 400),
          child: Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green.shade200),
                overlayColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text('CONFIRMAR', style: TextStyle(color: Colors.black)),
              onPressed: () {
                setState(() {});
              },
            ),
          ),
        ),
        // Proceso de Pago :
        AnimatedScale(
          scale: scale.value,
          duration: Duration(seconds: 1),
          curve: Curves.bounceOut,
          child: _Payment(
              preciofinal: preciofinal, consumProvider: consumProvider),
        ),
      ],
    );
  }
}

class _Payment extends StatelessWidget {
  final String preciofinal;
  final LogicVenta consumProvider;

  const _Payment({required this.preciofinal, required this.consumProvider});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: 40,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total de la Compra',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 4,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(width: 20),
                Text(
                  '\$$preciofinal',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 4,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: 7),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green.shade200),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: Icon(Icons.check_circle_sharp,
                      color: Colors.green, size: 100),
                  onPressed: () {
                    consumProvider.clearCar();
                    Navigator.of(context).pushReplacementNamed('homeScreen');
                    // Navigator.pushReplacement(
                    //   context,
                    //     transitionDuration: const Duration(milliseconds: 900),
                    //   PageRouteBuilder(
                    //     pageBuilder: (_, animation, __) {
                    //       return FadeTransition(
                    //           opacity: animation, child: HomeScreen());
                    //     },
                    //   ),
                    // );
                  },
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 12,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(' PAGAR ', style: TextStyle(fontSize: 3)),
              ),
            ),
          ],
        ),
      );
}

class _ItemsDetails extends StatelessWidget {
  final Producto producto;

  const _ItemsDetails({required this.producto});

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Icon(Icons.check_circle, color: Colors.green),
        title: Text(producto.nombre),
        trailing: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.transparent,
          child: Image.asset('assets/zapatillas/${producto.portadaUrlImg}'),
        ),
        subtitle: Text(' \$ ${producto.precio.toString()}'),
      );
}
