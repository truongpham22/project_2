import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_2/bottomNav/chatting.dart';
import 'package:project_2/model/Modelchat.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ModelChat> chats = [
    ModelChat('Doraemon', 'Xin chao!!!', '13:10',
        'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg'),
    ModelChat('Nobita', 'Hello!!!', '13:10',
        'https://i.pinimg.com/1200x/01/72/11/017211aa0826cdb3cdba283b35c28a5b.jpg'),
    ModelChat('Xeko', 'Xin chao, toi la dai dien cua Tesla!!!', '13:10',
        'https://cdn.popsww.com/blog/sites/2/2023/05/suneo-anime.jpg'),
    ModelChat('Xizuka', 'Bongjo!!!', '13:10',
        'https://i.pinimg.com/736x/db/e9/2d/dbe92df024a6b45f7ce986e9f9597e82.jpg'),
    ModelChat(
        'Chaien',
        'Đi nghe tớ hát nè, tớ sẽ hát tặng bạn thật nhiều bài nhé. Coming up',
        '13:10',
        'https://demoda.vn/wp-content/uploads/2022/03/anh-chaien-an-khoai-lang.jpg'),
  ];
  TextEditingController controller = TextEditingController();
  List<ModelChat> result = [];
  @override
  void initState() {
    setState(() {
      result = chats;
    });
  }

  search(String keyWord) {
    keyWord = controller.text;
    // print('$keyWord');
    if (keyWord.isEmpty) {
      result = chats;
    } else {
      result = chats
          .where((element) =>
              element.title.toLowerCase().contains(keyWord.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Chats'),
        actions: [
          iconAction(icon: Icons.shopping_cart, sl: '10'),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: iconAction(icon: Icons.notifications, sl: '12'),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  search(value);
                });
              },
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.clear();
                      result = chats;
                    });
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                ),
                filled: true,
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.black),
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Chatting(modelChat: result[index]),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.black),
                      )),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              result[index].image,
                            ),
                            radius: 25,
                          ),
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        result[index].title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(result[index].time),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 110,
                                        child: Text(
                                          result[index].content,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 10,
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconAction({
    required IconData icon,
    required String sl,
  }) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.white),
            ),
            child: Icon(icon),
          ),
        ),
        Positioned(
          child: Container(
            margin: const EdgeInsets.only(left: 26),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 10,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 9,
                child: Text(
                  sl,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
