import 'package:flutter/material.dart';

class NotificationNav extends StatefulWidget {
  const NotificationNav({super.key});

  @override
  State<NotificationNav> createState() => _NotificationNavState();
}

class _NotificationNavState extends State<NotificationNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        actions: [
          GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: SizedBox(width: 60, child: Icon(Icons.delete)))
        ],
      ),
      body: Form(
          child: Column(
        children: [
          itemNotification(
              title: 'Noel coming up',
              content: '24/12 Noel',
              url:
                  'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg'),
          iconNotification(
              title: 'Event Noel 24-25/12',
              content: 'Welcome Noel - Happy Noel',
              icon: Icons.event_note),
          itemNotification(
              title: 'Noel coming up',
              content: '24/12 Noel',
              url:
                  'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg'),
          itemNotification(
              title: 'Noel coming up',
              content: '24/12 Noel',
              url:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIeMRty5cel1cLU5mbgLTdXadjboLBCzv_2w&usqp=CAU'),
        ],
      )),
    );
  }

  Widget itemNotification({required String title, content, url}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(url),
              radius: 26,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(198, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget iconNotification(
      {required String title, content, required IconData icon}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Icon(icon)),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(198, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
