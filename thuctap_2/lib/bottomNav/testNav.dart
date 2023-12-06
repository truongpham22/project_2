import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: testNav(),
    ),
  );
}

class testNav extends StatefulWidget {
  const testNav({super.key});

  @override
  State<testNav> createState() => _testNavState();
}

class _testNavState extends State<testNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Nav'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              test(Icons.home, '24'),
              test(Icons.notifications, '2'),
              test(Icons.settings, '20')
            ],
          ),
        ],
      ),
    );
  }

  Widget test(IconData icon, String sl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Icon(
              icon,
              size: 39,
            ), //Icon
          ),
          Positioned(
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Text(
                sl,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
