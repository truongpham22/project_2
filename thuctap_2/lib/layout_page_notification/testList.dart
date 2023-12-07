import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // List<String> listTitle = <String>[
  //   'Noel coming up',
  //   'Noel coming up',
  //   'Noel coming up',
  // ];
  // List<String> listContent = <String>[
  //   '24/12 Noel',
  //   '25/12 Noel',
  //   '26/12 Noel',
  // ];
  // List<String> listUrl = <String>[
  //   'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
  //   'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIeMRty5cel1cLU5mbgLTdXadjboLBCzv_2w&usqp=CAU',
  // ];

  List<Map<String, dynamic>> list = [
    {
      'index': 0,
      'title': 'Hit the road - Ray Charles',
      'content': '24/12 Noel',
      'images':
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
    },
    {
      'index': 1,
      'title': 'Hit the road - Ray Charles',
      'content': '25/12 Noel',
      'images':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIeMRty5cel1cLU5mbgLTdXadjboLBCzv_2w&usqp=CAU',
    },
    {
      'index': 2,
      'title': 'Hit the road - Ray Charles',
      'content': '26/12 Noel',
      'images':
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
    },
    {
      'index': 3,
      'title': 'Hit the road - Ray Charles',
      'content': '26/12 Noel',
      'images':
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    print('tổng số lượng:::${list.length}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
              onTap: () {
                setState(() {
                  if (list.isNotEmpty) {
                    list.clear();
                  }
                });
              },
              child: const SizedBox(width: 60, child: Icon(Icons.delete)))
        ],
      ),
      body: Container(
        child: list.isNotEmpty
            ? ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(list[index]['images']),
                                  radius: 26,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list[index]["title"],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(197, 200, 36, 36),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      list[index]['content'],
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  list.removeWhere((element) =>
                                      element['index'] == list[index]['index']);
                                });
                              },
                              child: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                })
            : const Center(
                child: Text(
                  'No Notification',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
      ),
    );
  }
}
