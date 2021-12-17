// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
//
import 'shop_screen.dart';
import 'youtube_play.dart';
import 'efecto_screen.dart';
import 'transform_screen.dart';
import 'tween_animation_builder.dart';
import 'animated_switcher_screen.dart';
import 'value_listenable_builder.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Flutter Animations'),
          centerTitle: true,
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _pages.length,
          itemBuilder: (_, i) => ListTile(
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text(_pages[i].title),
            leading: Icon(Icons.android_outlined),
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, animation, __) => ScaleTransition(
                  // opacity: animation,
                  scale: animation,
                  child: _pages[i].page,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          heroTag: 'HeroBackButtom',
          onPressed: () {},
          child: Icon(Icons.add),
          tooltip: 'Increment',
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.home)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_shopping_cart_outlined)),
              SizedBox(width: 10),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            ],
          ),
        ),
      );
}

List<_Pages> _pages = [
  _Pages('Tween Animation Builder', TweenAnimationBuilderScreen()),
  _Pages('Page View con efecto 3D', Efecto3D()),
  _Pages('Value Listenable Listener', ValueListenableBuilderScreen()),
  _Pages('Youtube Player', YoutubePlayerScreen()),
  _Pages('Transform Widget', TransformScreen()),
  _Pages('Animated Switcher', AnimatedSwitcherScreen()),
  _Pages('Shoes Shopping', ShopScreen()),
];

class _Pages {
  String title;
  Widget page;

  _Pages(this.title, this.page);
}
