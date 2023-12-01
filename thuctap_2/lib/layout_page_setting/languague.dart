import 'package:flutter/material.dart';

import '../input.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  widgetLogin bc = widgetLogin();
  int selected = -1;
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
                  selected = 1;
                  bool isCheck = !bc.isChecked1;
                  bc.isChecked1 = isCheck;
                  print('viet:: $isCheck');
                });
              },
              child: infoLanguages(
                  index: 1,
                  // check: bc.isChecked1,
                  name: "Vietnamese",
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = 2;
                  bool isCheck = !bc.isChecked2;
                  bc.isChecked2 = isCheck;
                  print('engg:: $isCheck');
                });
              },
              child: infoLanguages(
                  index: 2,
                  // check: bc.isChecked2,
                  name: "English",
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bool isCheck = !bc.isChecked3;
                  bc.isChecked3 = isCheck;
                  selected = 3;
                });
              },
              child: infoLanguages(
                  index: 3,
                  // check: bc.isChecked3,
                  name: "Germany",
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

  Widget infoLanguages({
    required String name,
    Widget? icon,
    // bool? check,
    int? index,
  }) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Text(name, style: const TextStyle(fontSize: 16)),
          ),
          // if (check ?? false) icon ?? const SizedBox.shrink()
          // if (icon != null) icon,
          if (selected == index) icon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
