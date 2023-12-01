import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_2/layout_info/info.dart';

final dio = Dio();

class API {
  static API get ins => instance;
  static final API instance = API._internal();
  API._internal();

  login(String email, String Pass, BuildContext context) async {
    Response response;
    response = await dio.post(
        'http://restapi.adequateshop.com/api/authaccount/login',
        data: {"email": email, "password": Pass});

    if (response.data != null) {
      _showMyDialog(context, 'success', 'ok');
      print('response::${response.data}');
    }
  }

  Future<void> _showMyDialog(
      BuildContext context, String title, content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Setting()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  register(String email, name, pass) async {
    Response response;

    response = await dio.post(
        'http://restapi.adequateshop.com/api/authaccount/registration',
        data: {'name': name, 'email': email, 'password': pass});
    print(['test:', response]);
  }
}
