import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_2/model/Modelchat.dart';

class Chatting extends StatefulWidget {
  final ModelChat modelChat;

  const Chatting({super.key, required this.modelChat});
  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        title: Text(widget.modelChat.title),
        actions: [
          iconAction(Icons.call),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: iconAction(Icons.more_horiz),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              timeCenter(
                time: '04 Dec 2023',
              ),
              paraChat(
                time: '10:08',
                avt: widget.modelChat.image,
                content: 'alo bro, co o nha khong',
              ),
              paraChat(
                time: '10:09',
                content: 'Ngay mai bro co ranh khong?',
              ),
              timeCenter(
                time: widget.modelChat.time,
              ),
              paraChat(
                time: widget.modelChat.time,
                avt: widget.modelChat.image,
                content: widget.modelChat.content,
              ),
              paraChat(
                role: 'your',
                time: widget.modelChat.time,
                content: 'De t sap xep nhe',
              ),
              paraChat(
                role: 'your',
                time: '13:11',
                content: 'co gi t se nhan tin lai cho m nhe gut bai',
              ),
              paraChat(
                role: 'your',
                time: '13:11',
                content:
                    'https://cdn.vietnammoi.vn/1881912202208777/images/2022/12/21/anh-giang-sinh-20221221173218577.jpg?width=700',
                image:
                    'https://cdn.vietnammoi.vn/1881912202208777/images/2022/12/21/anh-giang-sinh-20221221173218577.jpg?width=700',
              ),
              paraChat(
                iconFail: const Icon(
                  Icons.clear,
                  color: Colors.amber,
                ),
                iconResend: const Icon(
                  Icons.restore,
                  color: Color.fromARGB(255, 10, 145, 255),
                ),
                role: 'your',
                time: '13:11',
                content: 'co gi t se nhan tin lai cho m nhe gut bai',
              ),
              paraChat(
                role: 'your',
                time: '13:11',
                content: 'Càfe cho nay ngon ne',
              ),
              seen(),
              paraChat(
                time: '13:11',
                avt: widget.modelChat.image,
                content: 'Co gi t se di choi noel voi m nhe',
              ),
              paraChat(
                role: 'your',
                time: '13:11',
                reply: 'notEmpty',
                content: 'De t suy xet !',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget timeCenter({required String time}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(time),
    );
  }

  Widget seen() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.check,
            size: 16,
          ),
          SizedBox(
            width: 6,
          ),
          Text('Seen'),
        ],
      ),
    );
  }

  Widget paraChat({
    required String time,
    content,
    String? avt,
    image,
    String? role,
    String? reply,
    Widget? iconFail,
    iconResend,
  }) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: role == null
          ? Row(
              children: [
                // Container(
                //   alignment: Alignment.topLeft,
                //   child: CircleAvatar(
                //     radius: 16,
                //     backgroundImage: NetworkImage(
                //       avt ?? widget.modelChat.image,
                //     ),
                //   ),
                // ),
                (avt != null)
                    ? Container(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(avt),
                        ),
                      )
                    : const SizedBox(
                        width: 32,
                      ),

                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 234, 234, 234),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            // widget.modelChat.content,
                            content,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          // widget.modelChat.time,
                          time,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (iconFail != null) iconFail,
                    if (iconFail != null)
                      const Text(
                        'Failed',
                        style: TextStyle(color: Colors.amber),
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Container(

                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (iconResend != null)
                                ? Colors.grey
                                : Colors.blue.shade100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (reply != null)
                                ? Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.amber),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.reply),
                                            Text(widget.modelChat.title),
                                          ],
                                        ),
                                        const Text(
                                          'co',
                                          textAlign: TextAlign.start,
                                        )
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Column(
                                    children: [
                                      Text(
                                        // widget.modelChat.content,
                                        content,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      (image != null)
                                          ? Container(
                                              color: Colors.red,
                                              width: double.maxFinite,
                                              child: Image.network(
                                                image,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  // widget.modelChat.time,
                                  time,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (iconResend != null) iconResend,
                    if (iconResend != null)
                      const Text(
                        'Resend',
                        style:
                            TextStyle(color: Color.fromARGB(255, 10, 145, 255)),
                      ),
                  ],
                ),
              ],
            ),
    );
  }

  Widget iconAction(IconData icon) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      child: Icon(icon),
    );
  }
}
