import 'package:flutter/material.dart';

class Block extends StatefulWidget {
  const Block({super.key});

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Block'),
      ),
      body: Form(
          child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Text(
              'Khi bạn chặn một ai đó, họ sẽ không thể gọi điện, nhắn tin và theo dõi được bạn; càng không thể gắn thẻ (scan) qua mã vạch (QR Code) với bạn',
              style: TextStyle(fontSize: 16),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(28)),
                          color: Colors.blue.shade200),
                      child: const Icon(
                        Icons.add,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Thêm vào danh sách chặn')
                ],
              ),
            ),
            infoBlock(
                name: 'Shop biiiii',
                url:
                    'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg'),
            infoBlock(
                name: 'Laza daaaaa',
                url:
                    'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg')
          ],
        ),
      )),
    );
  }

  Widget infoBlock({required String name, url}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      margin: const EdgeInsets.only(top: 10),
      child: Container(
        margin: const EdgeInsets.only(top: 14, bottom: 4),
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 23,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(url),
                    radius: 22,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(28))),
              padding: const EdgeInsets.all(18),
              child: const Text('Bỏ chặn'),
            )
          ],
        ),
      ),
    );
  }
}
