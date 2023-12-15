import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_2/MainApp.dart';
import 'package:project_2/bottomNav/bottom_nav.dart';
import 'package:project_2/layout_page_home/product.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 900,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.linear, // hieu ung chuyen dong
                enlargeCenterPage: true, // center to
                enlargeFactor: 0.5, // 2 ben se con lo 1 xiu mep anh
                scrollDirection: Axis.horizontal,
              ),
              items: [
                widget.product.img,
                'https://bizweb.dktcdn.net/100/438/626/products/65e85ade-ca9c-4bf3-adcb-17637e034cdd-1659339874911.jpg?v=1659339883123',
                'https://bizweb.dktcdn.net/100/438/626/products/86e72f69-61f7-4798-9dfd-74cb4892bb7d-1659339875582.jpg?v=1659339884473',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(
                      i,
                      fit: BoxFit.cover,
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.title,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w700)),
                Text(
                  widget.product.content,
                  style: const TextStyle(fontSize: 16, color: Colors.green),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.price,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Icon(Icons.chat),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: TextButton(
                          style: ButtonStyle(
                              minimumSize: const MaterialStatePropertyAll(
                                Size(100, 50),
                              ),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.blue),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                          onPressed: () {
                            showBottomSheet(context);
                          },
                          child: const Text(
                            'Order',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         setState(
          //           () {
          //             bc.checkSize = 's';
          //           },
          //         );
          //       },
          //       child: iconSize(
          //         size: 'S',
          //         checkSize: bc.checkSize == 's',
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         setState(
          //           () {
          //             bc.checkSize = 'm';
          //           },
          //         );
          //       },
          //       child: iconSize(
          //         size: 'M',
          //         checkSize: bc.checkSize == 'm',
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         setState(
          //           () {
          //             bc.checkSize = 'l';
          //           },
          //         );
          //       },
          //       child: iconSize(
          //         size: 'L',
          //         checkSize: bc.checkSize == 'l',
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         setState(
          //           () {
          //             bc.checkSize = 'xl';
          //           },
          //         );
          //       },
          //       child: iconSize(
          //         size: 'XL',
          //         checkSize: bc.checkSize == 'xl',
          //       ),
          //     ),
          //   ],
          // ),
          support(),
        ],
      ),
      // bottomNavigationBar: const BottomNav(),
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.network(widget.product.img),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text(widget.product.title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Text(widget.product.price)
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, bottom: 30),
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 226, 226, 226),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 108, top: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Color',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.network(widget.product.img),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Black',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: -150,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(widget.product.img),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'White',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -90,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(widget.product.img),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'White',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Size',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                print('${bc.checkSize}');
                                bc.checkSize = 's';
                              },
                            );
                          },
                          child: iconSize(
                            size: 'S',
                            checkSize: bc.checkSize == 's',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('${bc.checkSize}');
                            setState(
                              () {
                                bc.checkSize = 'm';
                              },
                            );
                          },
                          child: iconSize(
                            size: 'M',
                            checkSize: bc.checkSize == 'm',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('${bc.checkSize}');
                            setState(
                              () {
                                bc.checkSize = 'l';
                              },
                            );
                          },
                          child: iconSize(
                            size: 'L',
                            checkSize: bc.checkSize == 'l',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                bc.checkSize = 'xl';
                              },
                            );
                          },
                          child: iconSize(
                            size: 'XL',
                            checkSize: bc.checkSize == 'xl',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget iconSize({required String size, bool? checkSize}) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: (checkSize ?? false) ? Colors.blue : Colors.white,
      ),
      child: Center(
        child: Text(
          size,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget support() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Icon(Icons.local_shipping_outlined),
              SizedBox(
                width: 10,
              ),
              Text('Giao hàng toàn quốc'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10,
              ),
              Text('Cam kết chính hãng'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(Icons.compare_arrows),
              SizedBox(
                width: 10,
              ),
              Text('Hỗ trợ đổi size'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(Icons.shield_outlined),
              SizedBox(
                width: 10,
              ),
              Text('Bảo hành theo chính sách của hãng'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
