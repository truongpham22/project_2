import 'package:flutter/material.dart';
import 'package:project_2/bottomNav/notification_Nav.dart';
import 'package:project_2/layout_page_notification/testList.dart';

import '../layout_info/info.dart';
import '../layout_page_home/home_layout.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static const TextStyle style =
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  static const List<Widget> _listItem = <Widget>[
    Home(),
    // NotificationNav(),
    Test(),
    Setting()
  ];
  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
      print("$index");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _listItem.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Badge(child: Icon(Icons.home_sharp)), label: 'Home'),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text(
                '3',
                style: TextStyle(fontSize: 14),
              ),
              child: Icon(Icons.notifications_sharp),
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onTapItem,
      ),
    );
  }
}
