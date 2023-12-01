import 'package:flutter/material.dart';

import '../input.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  widgetLogin bc = widgetLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Form(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  bool check = !bc.isChecked1;
                  bc.isChecked1 = check;
                });
              },
              child: infoNoti(
                  title: 'Comment',
                  isCheck: bc.isChecked1,
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bool check = !bc.isChecked2;
                  bc.isChecked2 = check;
                });
              },
              child: infoNoti(
                  title: 'Message',
                  isCheck: bc.isChecked2,
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bool check = !bc.isChecked3;
                  bc.isChecked3 = check;
                });
              },
              child: infoNoti(
                  title: 'Follow',
                  isCheck: bc.isChecked3,
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bool check = !bc.isChecked4;
                  bc.isChecked4 = check;
                });
              },
              child: infoNoti(
                  title: 'Add friend',
                  isCheck: bc.isChecked4,
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )),
            ),
          ],
        ),
      )),
    );
  }

  Widget infoNoti(
      {required String title, Widget? icon, required bool isCheck}) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          )),
          if (isCheck) icon!,
        ],
      ),
    );
  }
}
