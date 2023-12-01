import 'package:flutter/material.dart';

import '../input.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  widgetLogin bc = widgetLogin();
  int select = 0;
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
                  bool isCheck = !bc.isChecked1;
                  bc.isChecked1 = isCheck;
                  print('viet:: $isCheck');
                });
              },
              child: infoLanguages(
                  index: 1,
                  check: bc.isChecked1,
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
                  bool isCheck = !bc.isChecked2;
                  bc.isChecked2 = isCheck;
                  select == 3;
                  print('$select');
                });
              },
              child: infoLanguages(
                  index: 2,
                  // select: sl,
                  check: select == 3 ? bc.isChecked2 : false,
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
                  select == 2;
                });
              },
              child: infoLanguages(
                  // index: 3,
                  // select: sl,
                  check: select == 2 ? bc.isChecked3 : false,
                  name: "Germany",
                  icon: select == 2
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 20,
                        )
                      : const SizedBox.shrink()),
            ),
          ],
        ),
      )),
    );
  }

  // void test(int selected) {
  //   if (selected == sl) {}
  // }

  Widget infoLanguages(
      {required String name, Widget? icon, bool? check, int? index, select}) {
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
          if (check ?? false) icon ?? const SizedBox.shrink()
          // if (icon != null) icon,
        ],
      ),
    );
  }
}
