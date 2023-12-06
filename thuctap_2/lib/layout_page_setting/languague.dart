import 'package:flutter/material.dart';

import '../input.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  widgetLogin bc = widgetLogin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Languages'),
      ),
      body: Form(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  bc.isCheck = 'vi';
                });
              },
              child: infoLanguages(
                  check: bc.isCheck == 'vi',
                  text: 'Vietnamese',
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bc.isCheck = 'en';
                });
              },
              child: infoLanguages(
                  check: bc.isCheck == 'en',
                  text: 'English',
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bc.isCheck = 'ge';
                });
              },
              child: infoLanguages(
                  check: bc.isCheck == 'ge',
                  text: 'Germany',
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

  Widget infoLanguages({required String text, Widget? icon, bool? check}) {
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
            text,
            style: const TextStyle(fontSize: 16),
          )),
          // if (icon != null) icon,
          if (check ?? false) icon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
