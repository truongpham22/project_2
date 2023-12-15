import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

TextEditingController contTitle = TextEditingController();
TextEditingController contContent = TextEditingController();
int tt = 0;
int ct = 0;

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text('Create New Piper'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            child: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title'),
            TextFormField(
              maxLines: 4,
              minLines: 2,
              decoration: InputDecoration(
                hintText: 'Title',
                counterText: '$tt /200',
              ),
              style: const TextStyle(fontSize: 20),
              controller: contTitle,
              onChanged: (value) {
                setState(() {
                  tt = contTitle.text.length;
                  if (tt > 5) {
                    contTitle.clear();
                    tt = 0;
                    setState(() {});
                  }
                });
              },
            ),
            const Text('Content'),
            TextFormField(
              maxLines: 8,
              minLines: 3,
              decoration: InputDecoration(
                hintText: 'Content',
                counterText: '$ct /1000',
              ),
              style: const TextStyle(fontSize: 20),
              controller: contContent,
              onChanged: (value) {
                setState(() {
                  ct = contContent.text.length;
                  if (ct > 1000) {
                    contContent.clear();

                    ct = 0;
                    setState(() {});
                  }
                });
              },
            ),
            const Text('Image'),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 160),
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.grey,
                  ),
                ),
                child: const Icon(
                  Icons.image_search,
                  size: 56,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(
                  text: 'CLEAR',
                  clear: () {
                    contTitle.clear();
                    contContent.clear();
                    tt = 0;
                    ct = 0;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                button(
                  text: 'POST',
                  clear: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget button({required String text, required Function() clear}) {
    return SizedBox(
      width: 160,
      height: 50,
      child: ElevatedButton(
          style: const ButtonStyle(),
          onPressed: () {
            clear();
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          )),
    );
  }
}
