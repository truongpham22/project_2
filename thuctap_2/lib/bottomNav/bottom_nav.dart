import 'package:flutter/material.dart';
import 'package:project_2/bottomNav/chat.dart';
import 'package:project_2/bottomNav/notification_Nav.dart';
import 'package:project_2/bottomSheet/create.dart';
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
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  int _selectedIndex = 0;
  static const TextStyle style =
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  static const List<Widget> _listItem = <Widget>[
    Home(),
    Chat(),
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
    // print('bottom:::${check}');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 180,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Create(),
                              ));
                        },
                        child: bottomSheet(
                            color: const Color.fromARGB(255, 219, 163, 80),
                            text: 'Create piper',
                            icon: const Icon(Icons.panorama)),
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      bottomSheet(
                          color: Colors.green.shade400,
                          text: 'Live Stream',
                          icon: const Icon(Icons.live_tv)),
                    ],
                  ),
                ),
              );
            },
          );
        },

        child: const Icon(Icons.add), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: _listItem.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                _onTapItem(0);
              },
            ),
            Stack(
              children: [
                Positioned(
                  child: IconButton(
                    icon: const Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _onTapItem(1);
                    },
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(left: 30, top: 8),
                    child: const CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // IconButton(
            //   icon: const Icon(
            //     Icons.message,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //     _onTapItem(1);
            //   },
            // ),
            IconButton(
              icon: const Icon(
                Icons.notifications_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                _onTapItem(2);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                _onTapItem(3);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet(
      {required String text, required Color color, Widget? icon}) {
    return Container(
      width: 150,
      height: 80,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon,
          Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
