import 'package:flutter/material.dart';
import 'package:project_2/layout_page_setting/account.dart';
import 'package:project_2/layout_page_setting/languague.dart';
import 'package:project_2/layout_page_setting/notification.dart';
import 'package:project_2/main.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Form(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Account(),
                      ));
                },
                child: Container(
                  child: setting("My account", Icons.people, Icons.arrow_right),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ));
                },
                child: Container(
                  child: setting(
                      "Notification", Icons.notifications, Icons.arrow_right),
                ),
              ),
              Container(
                child: setting("About", Icons.question_mark, Icons.arrow_right),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Languages()));
                },
                child: Container(
                  child:
                      setting("Languages", Icons.language, Icons.arrow_right),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Row(
                    children: [
                      Text(
                        'Log out',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shadowColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.black)),
                      ),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 16, horizontal: 120))),
                  child: const Text(
                    'Delete account',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget setting(String name, IconData iconBefore, iconAfter) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      margin: const EdgeInsets.only(top: 15),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.shade100),
                  padding: const EdgeInsets.all(10),
                  child: Icon(iconBefore),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Icon(iconAfter),
          ],
        ),
      ),
    );
  }
}
