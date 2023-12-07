import 'package:flutter/material.dart';
import 'package:project_2/bottomNav/notification_Nav.dart';
import 'package:project_2/input.dart';
import 'package:project_2/layout_page_notification/testList.dart';

import '../layout_info/info.dart';
import '../layout_page_home/home_layout.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  bool check = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      bc.checkMode = check;
      print('checkMode:${bc.checkMode}');
    });
  }

  int _selectedIndex = 0;
  widgetLogin bc = widgetLogin();

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
    });
  }

  @override
  Widget build(BuildContext context) {
    print('${bc.checkMode}');
    return Scaffold(
      body: Center(
        child: _listItem.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: bc.,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Badge(
                child: Icon(Icons.home_sharp),
              ),
              label: 'Home'),
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
        backgroundColor: check ? Colors.amber : Colors.blue,
        selectedItemColor: const Color.fromRGBO(255, 152, 0, 1),
        onTap: _onTapItem,
      ),
    );
  }
}
