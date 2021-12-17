// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, unused_local_variable, avoid_unnecessary_containers, unrelated_type_equality_checks, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
//
import 'package:app_examples/models/productos.dart';
import 'package:app_examples/provider/logic_venta.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final consumeProvider = Provider.of<LogicVenta>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('SHOES SHOPPING'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: (consumeProvider.carritoCompra.isEmpty)
                ? Icon(Icons.shopping_bag_outlined)
                : Icon(Icons.shopping_bag),
            onPressed: () => Navigator.pushNamed(context, 'carSale',
                arguments: consumeProvider.carritoCompra),
          ),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => consumeProvider.addStock(
                    Producto(
                        id: 11,
                        precio: 199.990,
                        nombre: 'Air Force Nike Blue',
                        categoria: 'calzados',
                        background: Colors.blue.shade700,
                        portadaUrlImg: '11.png'),
                  )),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 2.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30),
        itemCount: consumeProvider.products.size(),
        itemBuilder: (_, i) {
          final Producto product = consumeProvider.products.readOne(i);
          return _ProductDetails(producto: product);
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'HeroBackButtom',
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.home),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Producto producto;
  const _ProductDetails({required this.producto});

  @override
  Widget build(BuildContext context) {
    producto.heroid = '${producto.id} - hero';
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: producto.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Hero(
              tag: producto.heroid!,
              child: (producto.id == 3 || producto.id == 8 || producto.id == 10)
                  ? Image.asset('assets/zapatillas/${producto.portadaUrlImg}',
                      height: 107)
                  : Image.asset('assets/zapatillas/${producto.portadaUrlImg}'),
            ),
          ),
          SizedBox(height: 10),
          Text(
            producto.nombre,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: (producto.background == Colors.black54)
                    ? Colors.white
                    : Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Text(
            producto.precio.toString(),
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: (producto.background == Colors.black54)
                    ? Colors.white
                    : Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detailsShop',
                arguments: producto),
            child: Container(
              width: 80,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
              child:
                  Text('Buy ->', style: TextStyle(fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
