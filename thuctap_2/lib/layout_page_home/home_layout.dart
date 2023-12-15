import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_2/input.dart';
import 'package:project_2/layout_detail/detailProduct.dart';
import 'package:project_2/layout_page_home/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
      'BLACK CAT TEE VIVASTUDIO',
      '850.000₫',
      'https://bizweb.dktcdn.net/100/438/626/products/e440c314-ec02-4e0f-aa92-fd8fbe019294.jpg?v=1693050519813',
      'Updating...',
    ),
    Product(
      'NEW BALANCE (WX608WT)',
      '2.500.000₫',
      'https://bizweb.dktcdn.net/100/438/626/products/8c59431f-f825-4101-bf05-3c4d067ead08.jpg?v=1702100848083',
      'Updating...',
    ),
    Product(
      'ADIDAS CAMOUFAGE - GK9615',
      '950.000₫',
      'https://bizweb.dktcdn.net/thumb/1024x1024/100/438/626/products/8c6cedff-49bc-4965-83a9-123ab8535cde.jpg?v=1687499134957',
      'Updating...',
    ),
    Product(
      'NIKE FUTURA ICON LOGO (AR5005 100)',
      '950.000₫',
      'https://bizweb.dktcdn.net/100/438/626/products/7f782a12-35f0-44ef-a33d-5cd55ab4618e.jpg?v=1679376191477',
      'Updating...',
    ),
    Product(
      'SUPREME SS20 LAUGH NOW T-SHIRT WHITE',
      '2.500.000₫',
      'https://bizweb.dktcdn.net/100/438/626/products/a85039c6-51de-4a3c-ab12-56d2e466625b-1659339876387.jpg?v=1659339882450',
      'Updating...',
    ),
    Product(
      'TEDDY ISLAND TEE - BIG HAWAII (21SUMER_08) - WHITE',
      '950.000₫',
      'https://bizweb.dktcdn.net/100/438/626/products/7f577d88-862c-4d17-ac0a-a80b91e3594b-1660823973460.jpg?v=1660824087243',
      'Updating...',
    ),
    Product(
      'MUAHMUAH STITCH TURTLE NECK T-SHIRT - B/W',
      '950.000₫',
      'https://bizweb.dktcdn.net/100/438/626/products/849a51e2ca2a7a0181cfd0b8512eecba-1657113295824.jpg?v=1686645494357',
      'Updating...',
    ),
    Product(
      'COVERNAT ARCH LOGO T-SHIRTS WHITE',
      '450.000₫',
      'https://bizweb.dktcdn.net/100/438/626/products/1a7cd18a-06fd-4d3b-bcac-13244396504d.jpg?v=1655128138510',
      'Updating...',
    ),
  ];

  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();

    bc = Provider.of<widgetLogin>(context, listen: false);
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: !search ? null : 103,
        automaticallyImplyLeading: false,
        title: !search ? appBarHome() : appBarSearch(),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                ThemeData.dark();
                bc.checkMode = !bc.checkMode;
              });
            },
            child: !search
                ? const Icon(Icons.dark_mode_outlined)
                : const SizedBox.shrink(),
          ),
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
            GradientText(
              'PiepClothing',
              colors: [
                Colors.red.shade400,
                Colors.yellow.shade900,
              ],
              style: GoogleFonts.rubikBubbles(fontSize: 36),
            ),
            Banner(
              location: BannerLocation.topEnd,
              message: 'Welcome Noel',
              color: Colors.red,
              textStyle: const TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.yellow),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                    'https://img.lovepik.com/photo/40093/5006.jpg_wh860.jpg'),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 90,
              crossAxisSpacing: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding:
                  const EdgeInsets.only(bottom: 100, left: 8, right: 8, top: 8),
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
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        child: Image.network(
                          result[index].img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: -66,
                        child: SizedBox(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                result[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                result[index].price,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 45, 156, 247),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
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
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          setState(() {
            _runFilter(value);
          });
        },
        controller: textController,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  search = false;
                });
              },
              child: const Icon(
                Icons.clear,
                color: Colors.black,
              )),
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
