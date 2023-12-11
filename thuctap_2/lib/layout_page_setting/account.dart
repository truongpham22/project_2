import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Form(
          child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.black,
              radius: 51,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg'),
                radius: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text(
                    'Phạm Bá Trường',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 40,
                    margin: const EdgeInsets.only(top: 11),
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 9),
                child: const Text(
                  'ID: #1111',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                )),
            infoUser(name: 'Account', content: 'ba@gmail.com'),
            infoUser(
                name: 'Password', content: '●●●●●●', icon: Icon(Icons.shield)),
            infoUser(
                name: 'PIN',
                content: '●●●●●●',
                icon: Icon(Icons.phone_android_sharp))
          ],
        ),
      )),
    );
  }

  Widget infoUser({required String name, content, Widget? icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  content,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              if (icon != null) icon,
            ],
          ),
        ],
      ),
    );
  }
}
