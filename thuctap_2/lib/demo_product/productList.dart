import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import '../api_responlist.dart';
import '../model/product/product.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  void initState() {
    listPro();
    // TODO: implement initState
    super.initState();
  }

  final _dio = Dio();
  var listData = <ProductModel>[];

  Future<APIResponseList<ProductModel>> list() async {
    final response = await _dio.get('https://dummyjson.com/products');

    Map<String, dynamic> json = response.data;

    return APIResponseList.fromJson(
      json,
      (json) => ProductModel.fromJson(json as Map<String, dynamic>),
    );
  }

  listPro() async {
    final response = await list();
    print('product:${response.products}');
    final result = response.products ?? [];
    listData.addAll(result);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Row(
              children: [
                Text(
                  listData[index].brand ?? "",
                  style: TextStyle(color: Colors.white),
                ),
                // Expanded(
                //     child: Container(
                //   color: Colors.white,
                //   child: Text('Món ${img[index]['title']}',
                //       style: TextStyle(
                //           color: Colors.amber[colorProduct[index]],
                //           fontSize: 32)),
                // )),
              ],
            ),
          );
        });
  }
}
