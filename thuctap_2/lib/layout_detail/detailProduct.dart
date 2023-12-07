import 'package:flutter/material.dart';
import 'package:project_2/layout_page_home/product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            textAlign: TextAlign.center,
            product.title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Form(
          child: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 280,
            width: double.maxFinite,
            child: Image.network(
              product.img,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
                Text(
                  product.content,
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
