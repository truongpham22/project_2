import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_2/demo_product/productList.dart';
import 'package:project_2/layout_page_home/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;
  List<Product> products = [
    Product(
      title: '1',
      content: 'a',
      img:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIeMRty5cel1cLU5mbgLTdXadjboLBCzv_2w&usqp=CAU',
    ),
    Product(
      title: '2',
      content: 'b',
      img:
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
    ),
    Product(
      title: '3',
      content: 'c',
      img:
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
    ),
    Product(
      title: '4',
      content: 'd',
      img:
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
    ),
    Product(
      title: '5',
      content: 'e',
      img:
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
    ),
    Product(
      title: '6',
      content: 'f',
      img:
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
    ),
    Product(
      title: '7',
      content: 'g',
      img:
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
    ),
    Product(
      title: '8',
      content: 'j',
      img:
          'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
    ),
  ];
  // List<Product> _products {
  //   return [
  //     Product(
  //       title: '1',
  //       content: 'a',
  //       img:
  //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIeMRty5cel1cLU5mbgLTdXadjboLBCzv_2w&usqp=CAU',
  //     ),
  //     Product(
  //       title: '2',
  //       content: 'b',
  //       img:
  //           'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
  //     ),
  //     Product(
  //       title: '3',
  //       content: 'c',
  //       img:
  //           'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
  //     ),
  //     Product(
  //       title: '4',
  //       content: 'd',
  //       img:
  //           'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
  //     ),
  //     Product(
  //       title: '5',
  //       content: 'e',
  //       img:
  //           'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
  //     ),
  //     Product(
  //       title: '6',
  //       content: 'f',
  //       img:
  //           'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
  //     ),
  //     Product(
  //       title: '7',
  //       content: 'g',
  //       img:
  //           'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
  //     ),
  //     Product(
  //       title: '8',
  //       content: 'j',
  //       img:
  //           'https://icare-plus.vn/wp-content/uploads/2023/08/cach-ve-hinh-doraemon-tren-may-tinh-casino-1-min.jpg',
  //     ),
  //   ];
  // }

  TextEditingController textController = TextEditingController();
  // List<Product> products = [];
  @override
  void initState() {
    super.initState();
    // products = _products(context);
  }

  void _runFilter(String keyWord) {
    keyWord = textController.text;
    print('key {$keyWord}');
    List<Product> result = [];
    setState(() {
      result = products
          .where((element) =>
              element.title.toLowerCase().contains(keyWord.toLowerCase()))
          .toList();
      print('result::$result');
      print('products::$products');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: !search ? null : 103,
        leading: const Icon(Icons.arrow_back),
        title: !search ? appBarHome() : appBarSearch(),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                bool click = !search;
                search = click;
                print('sea la :::: {$search}');
              });
            },
            child: !search
                ? const Icon(
                    Icons.search,
                    size: 30,
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: (300 / 380),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          children: List.generate(products.length, (index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        child: Image.network(
                          products[index].img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 5),
                    child: Column(
                      children: [
                        Text(products[index].title,
                            style: Theme.of(context).textTheme.headlineSmall),
                        Text(products[index].content,
                            style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget appBarHome() {
    return const Text('Home');
  }

  Widget appBarSearch() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      child: TextField(
        onChanged: (value) {
          setState(() {
            _runFilter(value);
          });
        },
        controller: textController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  search = false;
                });
              },
              child: const Icon(Icons.clear)),
          filled: true,
          hintText: 'Search',
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
