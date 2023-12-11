import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Map<String, dynamic>> chats = [
    {
      'name': 'David',
      'content': 'Xin chao!!!',
      'time': '22:06',
      'image':
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg'
    },
    {
      'name': 'Ronaldo',
      'content': 'Xin chao!!!',
      'time': '22:06',
      'image':
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg'
    },
    {
      'name': 'Messi',
      'content': 'Xin chao!!!',
      'time': '22:06',
      'image':
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Chats'),
        actions: [
          const Icon(Icons.shopping_cart),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.notifications))
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(color: Colors.black),
                    )),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(chats[index]['image']),
                          radius: 25,
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    flex: 2,
                                    fit: FlexFit.tight,
                                    child: Row(children: [
                                      Flexible(
                                          child:
                                              Text('${chats[index]['name']}')),
                                    ]),
                                  ),
                                  Text('${chats[index]['time']}')
                                ],
                              ),
                              Text('${chats[index]['content']}')
                            ],
                          ),
                        ),
                      ],
                    ));
              }),
        ],
      ),
    );
  }

  // Widget chatting({
  //   required String title,
  //   required String content,
  //   required String time,
  //   String? sl,
  //   CircleAvatar? tb,
  // }) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(vertical: 20),
  //     decoration: const BoxDecoration(
  //         border: Border(
  //       bottom: BorderSide(color: Colors.black),
  //     )),
  //     child: Row(
  //       children: [
  //         const CircleAvatar(
  //           backgroundImage: NetworkImage(
  //               'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg'),
  //           radius: 25,
  //         ),
  //         Expanded(
  //           child: Container(
  //             margin: const EdgeInsets.only(left: 10),
  //             child: Column(
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       title,
  //                       style: const TextStyle(fontWeight: FontWeight.bold),
  //                     ),
  //                     Text(time),
  //                   ],
  //                 ),
  //                 const SizedBox(
  //                   height: 6,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     SizedBox(
  //                       width: 110,
  //                       child: Text(
  //                         content,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ),
  //                     if (tb != null)
  //                       CircleAvatar(
  //                         backgroundColor: Colors.red,
  //                         radius: 10,
  //                         child: Text(
  //                           sl!,
  //                           style: const TextStyle(
  //                               fontSize: 14, color: Colors.white),
  //                         ),
  //                       )
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
