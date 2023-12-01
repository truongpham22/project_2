import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeProduct(),
    ),
  );
}

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  final List<String> listProduct = <String>['A', 'B', 'C'];
  final List<int> colorProduct = <int>[600, 500, 100];
  final List<Map<String, dynamic>> img = [
    {
      'title': 'Hit the road - Ray Charles',
      'images':
          'https://t3.ftcdn.net/jpg/04/41/15/90/240_F_441159073_I5e6T5GQI0q010ENsWtxPWh5dtBr61eo.jpg'
    },
    {
      'title': 'How to grow sun flower',
      'images':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5HJ-aVMVztCmUKveKtag50kJfHEuPXHCue7W4Abfvvw&s'
    },
    {
      'title': 'The best books of all time by Victoc Hugo-an author',
      'images':
          'https://t3.ftcdn.net/jpg/04/41/15/90/240_F_441159073_I5e6T5GQI0q010ENsWtxPWh5dtBr61eo.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listProduct.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Row(
              children: [
                Image.network(img[index]['images']),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: Text('Món ${img[index]['title']}',
                      style: TextStyle(
                          color: Colors.amber[colorProduct[index]],
                          fontSize: 32)),
                )),
              ],
            ),
          );
        });
  }
}
