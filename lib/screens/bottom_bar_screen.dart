// ignore_for_file: use_key_in_widget_constructors, unused_element, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemCount: list_page.length,
        itemBuilder: (_, i) => list_page[i],
      ),
      bottomNavigationBar: SalomonBottomBar(
        curve: Curves.bounceOut,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.bounceOut);
          });
        },
        items: List.generate(
          list_navigator.length,
          (i) => SalomonBottomBarItem(
            icon: Icon(list_navigator[i].icon),
            title: Text(list_navigator[i].title),
            selectedColor: list_navigator[i].selectedColor,
            unselectedColor: list_navigator[i].unselectedColor,
            activeIcon: list_navigator[i].activeIcon,
          ),
        ),
      ),
    );
  }
}

class _BuildPage extends StatelessWidget {
  final String name;
  final Color color;
  final IconData icon;
  const _BuildPage(
      {required this.name, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 200),
          Text(name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
              )),
        ],
      ),
    );
  }
}

const List<_BuildPage> list_page = [
  _BuildPage(color: Colors.purple, icon: Icons.home, name: 'Home'),
  _BuildPage(color: Colors.pink, icon: Icons.favorite_border, name: 'Likes'),
  _BuildPage(color: Colors.orange, icon: Icons.search, name: 'Search'),
  _BuildPage(color: Colors.teal, icon: Icons.person, name: 'Profile'),
];

class _BottomNavigator {
  final String title;
  final IconData icon;
  final Color selectedColor, unselectedColor;
  final Widget activeIcon;

  const _BottomNavigator({
    required this.title,
    required this.icon,
    required this.selectedColor,
    required this.unselectedColor,
    required this.activeIcon,
  });
}

const List<_BottomNavigator> list_navigator = [
  _BottomNavigator(
    title: "Home",
    icon: Icons.favorite_border,
    activeIcon: Icon(Icons.home),
    selectedColor: Colors.purple,
    unselectedColor: Colors.purple,
  ),
  _BottomNavigator(
    title: 'Likes',
    icon: Icons.favorite_border,
    activeIcon: Icon(Icons.favorite),
    selectedColor: Colors.pink,
    unselectedColor: Colors.pink,
  ),
  _BottomNavigator(
    title: 'Search',
    icon: Icons.search_off,
    activeIcon: Icon(Icons.search),
    selectedColor: Colors.orange,
    unselectedColor: Colors.orange,
  ),
  _BottomNavigator(
    title: 'Profile',
    icon: Icons.person_outline,
    activeIcon: Icon(Icons.person),
    selectedColor: Colors.teal,
    unselectedColor: Colors.teal,
  ),
];
