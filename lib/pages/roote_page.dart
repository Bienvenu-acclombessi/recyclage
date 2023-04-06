import 'package:flutter/material.dart';
import 'package:recyclage/pages/home.dart';

import 'boutique.dart';
class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [HomeWidget(),MyBoutique()];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Depot',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Achat',
            ),
          ],
        ),
      
    );
  }
}