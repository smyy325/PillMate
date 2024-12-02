import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pill_mate/gemini/chat.dart';
import 'package:pill_mate/reminder/homme.dart';

class NavbarPage extends StatefulWidget {
  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [

    Home(),
    ChatPage(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white60,
        buttonBackgroundColor: Colors.purple[50],
        height: 60,
        animationDuration: Duration(milliseconds: 300),
        index: _selectedIndex,
        onTap: _navigateBottomBar,
        items: const [
          Icon(Icons.home_filled, size: 30),
          Icon(Icons.chat_rounded, size: 30),
        ],
      ),
    );
  }
}