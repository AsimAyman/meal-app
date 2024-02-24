import 'package:flutter/material.dart';
import 'package:untitled9/ui/screen/category_screen.dart';
import 'package:untitled9/ui/screen/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List _screens = [
    const CategoryScreen(),
    const FavoriteScreen(),
  ];

  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: (value) => setState(() {
          _currentScreenIndex = value;
        }),
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
