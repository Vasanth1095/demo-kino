import 'package:flutter/material.dart';

import 'home_page.dart';
import 'placeholder_page.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  static const routeName = '/home';

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    PlaceholderPage(
      title: 'Explore',
      icon: Icons.travel_explore_rounded,
      message: 'Explore collections will appear here.',
    ),
    PlaceholderPage(
      title: 'Favorites',
      icon: Icons.favorite_rounded,
      message: 'Liked and bookmarked films will appear here.',
    ),
    PlaceholderPage(
      title: 'Profile',
      icon: Icons.person_rounded,
      message: 'Profile settings will appear here.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
