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
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    //Cuộn xuống cuối bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        title: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(widget.modelChat.image),
                ),
                const Positioned(
                    bottom: -5,
                    right: -3,
                    child: Text(
                      '●',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    )),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.modelChat.title),
                  const Text(
                    'Online',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          iconAction(Icons.call),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: iconAction(Icons.more_horiz),
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          // cuon la dimiss keyboard
          controller: scrollController,
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
                paraChat(
                    role: 'your',
                    time: '',
                    image:
                        'https://cdn3.ivivu.com/2022/11/312346696_849489219804057_4087587568399950128_n.jpg'),
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
                seen(),
                // bool loveMessage = !isEmoji;
                //       isEmoji = loveMessage;
                paraChat(
                  emoji: isEmoji,
                  time: '13:11',
                  reply: 'notEmpty',
                  avt: widget.modelChat.image,
                  content: 'Tra loi t nhanh nhe',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          margin:
              const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: const TextStyle(
                      fontSize: 14.0, height: 1.0, color: Colors.black),
                  maxLines: 4,
                  minLines: 1,
                  decoration: InputDecoration(
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                          size: 26,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: const Icon(
                            Icons.emoji_emotions,
                            color: Colors.blue,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                    filled: true,
                    hintText: 'Message',
                    hintStyle:
                        const TextStyle(color: Color.fromARGB(255, 76, 76, 76)),
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Icon(
                  Icons.send,
                  size: 34,
                  color: Color.fromARGB(255, 22, 117, 195),
                ),
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

  bool isEmoji = false;
  Widget paraChat({
    String? time,
    String? content,
    String? avt,
    image,
    String? role,
    String? reply,
    Widget? iconFail,
    iconResend,
    bool? emoji,
  }) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: role == null
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  child: GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        bool loveMessage = !isEmoji;
                        isEmoji = loveMessage;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 234, 234, 234),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (reply != null)
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 216, 216, 216)),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start, //text reply
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.reply,
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            'P.B.Truong',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'De t suy xet !',
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: content != null
                                          ? Text(
                                              // widget.modelChat.content,
                                              content,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    (time != null)
                                        ? Text(
                                            // widget.modelChat.time,
                                            time,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                              (emoji == true)
                                  ? const Positioned(
                                      right: -20,
                                      bottom: -20,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    )
                                  : const Positioned(
                                      right: -20,
                                      bottom: -20,
                                      child: Icon(
                                        Icons.thumb_up,
                                        color:
                                            Color.fromARGB(255, 32, 122, 196),
                                      ),
                                    )
                            ],
                          ),
                        ],
                      ),
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
                          crossAxisAlignment: CrossAxisAlignment.end, //text
                          children: [
                            (reply != null)
                                ? Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 231, 231, 231)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, //name your reply
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.reply,
                                              color: Colors.blue,
                                            ),
                                            Text(
                                              widget.modelChat.title,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          'Co gi t se di choi noel voi m nhe',
                                          style: TextStyle(color: Colors.black),
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
                                      content != null
                                          ? Text(
                                              // widget.modelChat.content,
                                              content,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            )
                                          : const SizedBox.shrink(),
                                      (image != null)
                                          ? Image.network(
                                              image,
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                (time != null)
                                    ? Text(
                                        // widget.modelChat.time,
                                        time,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      )
                                    : const SizedBox.shrink(),
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
