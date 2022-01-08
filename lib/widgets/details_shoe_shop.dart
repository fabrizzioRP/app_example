// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_examples/models/shoes_model.dart';

class CustomShoesShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoe = ModalRoute.of(context)!.settings.arguments as Shoes;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _CustomAppBarShoe(shoe.image, shoe.id),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _CustomBodyDetailsShop(size: size, shoe: shoe),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarShoe extends StatelessWidget {
  String image;
  int id;

  _CustomAppBarShoe(this.image, this.id);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 30),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.white,
      expandedHeight: 580,
      pinned: true,
      stretch: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        stretchModes: const [StretchMode.zoomBackground],
        background: Hero(
          transitionOnUserGestures: true,
          tag: 'Shoes-$id',
          child: FadeInImage(
            placeholder:
                const AssetImage('assets/zapatillas/logo3.png'), // cambiar png
            image: NetworkImage(image),
            fit: BoxFit.fill,
            fadeInDuration: const Duration(seconds: 2),
            fadeInCurve: Curves.easeIn,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: Transform.translate(
          offset: const Offset(0, 1),
          child: Container(
            height: 45,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Container(
                width: 50,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomBodyDetailsShop extends StatelessWidget {
  const _CustomBodyDetailsShop({
    required this.size,
    required this.shoe,
  });

  final Size size;
  final Shoes shoe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.91,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoe.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Top Collection',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text('\$${shoe.precio}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500))
            ],
          ),
          const SizedBox(height: 40),
          Text(
            shoe.descripcion,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 60),
          const Text(
            'Colors',
            style: TextStyle(color: Colors.black38, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              shoe.colores.length,
              (i) => Container(
                margin: const EdgeInsets.all(1.0),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: shoe.colores[i].withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.check),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Size',
            style: TextStyle(color: Colors.black38, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              shoe.talla.length,
              (i) => Container(
                margin: const EdgeInsets.all(1.0),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${shoe.talla[i]}',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          const Spacer(),
          Material(
            color: Colors.yellow[800],
            elevation: 2,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: size.height * 0.9,
                height: 50,
                alignment: Alignment.center,
                child: const Text('Add to Cart',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
