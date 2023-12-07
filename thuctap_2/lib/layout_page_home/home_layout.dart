import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_2/bottomNav/bottom_nav.dart';
import 'package:project_2/input.dart';
import 'package:project_2/layout_detail/detailProduct.dart';
import 'package:project_2/layout_page_home/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;
  List<Product> result = [];
  List<Product> products = [
    Product(
      '1',
      'a',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIeMRty5cel1cLU5mbgLTdXadjboLBCzv_2w&usqp=CAU',
    ),
    Product('2', 'b',
        'https://channel.mediacdn.vn/2020/8/10/photo-1-159704507891874912873.jpg'),
    Product('3', 'c',
        'https://media.istockphoto.com/id/1316145932/vi/anh/b%E1%BA%A3ng-xem-tr%C3%AAn-c%C3%B9ng-c%E1%BB%A7a-th%E1%BB%A9c-%C4%83n-cay.jpg?b=1&s=612x612&w=0&k=20&c=CRsKGypvHxxevhQQn2AO-hkzy1KBMn0sqWLUN4Dua1Q='),
    Product('4', 'd',
        'https://www.foodstylistvn.com/wp-content/uploads/2014/08/sausage-on-fire-vietnam-food-stylist.jpg'),
    Product('5', 'e',
        'https://images.squarespace-cdn.com/content/v1/53883795e4b016c956b8d243/1562815515627-WUI5RN2UL8UZPT1WLROY/chup-anh-mon-an-nha-hang-chuyen-nghiep-4.jpg'),
    Product('6', 'f',
        'https://chuphinhmonan.com/wp-content/uploads/2017/03/dakgalbi-1-2.jpg'),
    Product('7', 'g',
        'https://www.chuphinhsanpham.vn/wp-content/uploads/2016/04/chup-hinh-mon-an-dep-c-photo-0002.jpg'),
    Product('8', 'j',
        'https://cdn.tgdd.vn/Files/2020/06/16/1263495/food_800x450.jpg'),
  ];

  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    result = products;
  }

  void _runFilter(String keyWord) {
    keyWord = textController.text;
    print('key {$keyWord}');
    setState(() {
      if (keyWord.isEmpty) {
        result = products.toList();
      } else {
        result = products
            .where((element) =>
                element.title.toLowerCase().contains(keyWord.toLowerCase()))
            .toList();
      }
    });
  }

  widgetLogin bc = widgetLogin();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: bc.checkMode ? ThemeData.light() : ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: !search ? null : 103,
          automaticallyImplyLeading: false,
          title: !search ? appBarHome() : appBarSearch(),
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    bc.checkMode = !bc.checkMode;
                    print('${bc.checkMode}');
                  });
                },
                child: !search
                    ? Icon(Icons.dark_mode_outlined)
                    : const SizedBox.shrink()),
            GestureDetector(
              onTap: () {
                setState(() {
                  bool click = !search;
                  search = click;
                  print('sea la :::: {$search}');
                });
              },
              child: !search
                  ? const SizedBox(
                      width: 50,
                      child: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GradientText('PiepTeam X Noel',
                  colors: [
                    Colors.red.shade400,
                    Colors.yellow.shade900,
                  ],
                  style: GoogleFonts.rubikBubbles(fontSize: 36)),
              Banner(
                location: BannerLocation.topEnd,
                message: 'Welcome Noel',
                color: Colors.red,
                textStyle: const TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.yellow),
                child: Image.network(
                    'https://cdn.vietnammoi.vn/1881912202208777/images/2022/12/21/anh-giang-sinh-3-20221221173207943.jpg?width=700'),
              ),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),
                children: List.generate(result.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(product: result[index]),
                          ));
                    },
                    child: Container(
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
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child: Image.network(
                                  result[index].img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            margin: const EdgeInsets.only(top: 10, left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(result[index].title,
                                    style: const TextStyle(fontSize: 26)),
                                Text(result[index].content,
                                    style: const TextStyle(fontSize: 20)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
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
