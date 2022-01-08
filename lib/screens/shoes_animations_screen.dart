// ignore_for_file: use_key_in_widget_constructors

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:app_examples/models/shoes_model.dart';

class ShoesAnimationScreen extends StatefulWidget {
  @override
  State<ShoesAnimationScreen> createState() => _ShoesAnimationScreenState();
}

class _ShoesAnimationScreenState extends State<ShoesAnimationScreen> {
  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.7,
  );

  double _currentPage = 0.0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: const Text('Shoes Shop',
            style: TextStyle(fontWeight: FontWeight.w300)),
      ),
      body: Center(
        child: PageView.builder(
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          itemCount: shoes.length,
          itemBuilder: (_, i) {
            final shoe = shoes[i];
            final percent = _currentPage - i;
            final value = percent.clamp(0.0, 1.0);
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scale(value + 1 - percent * value)
                ..rotateX(math.pi * value),
              child: _ShoeDetailsShop(shoe),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(() {});
    _pageController.dispose();
    super.dispose();
  }
}

class _ShoeDetailsShop extends StatelessWidget {
  final Shoes shoe;

  const _ShoeDetailsShop(this.shoe);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'customShop', arguments: shoe),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 185),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 290,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Hero(
                transitionOnUserGestures: true,
                tag: 'Shoes-${shoe.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder:
                        const AssetImage('assets/zapatillas/logo3.png'),
                    image: NetworkImage(shoe.image),
                    fit: BoxFit.cover,
                    width: 210,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              shoe.name,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black),
            ),
            const SizedBox(height: 35),
            const Text(
              'Limited Collection',
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
