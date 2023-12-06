import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_2/bottomNav/bottom_nav.dart';
import 'package:project_2/layout_info/info.dart';
import 'package:project_2/main.dart';

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
      // ignore: use_build_context_synchronously
      showdialog(
        context,
        content: 'HELLO MY FRIEND',
        title: 'WELCOME',
        onConfirm: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BottomNav()),
          );
        },
      );
      print('response::${response.data}');
    }
  }

  deleteAcc(BuildContext context) {
    showdialog(
      context,
      title: "DELETE",
      content: 'DELETE YOUR ACCOUNT',
      icon: Container(
        child: const Icon(Icons.dangerous),
      ),
      onConfirm: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      },
    );
  }

  showdialog(
    BuildContext context, {
    Widget? icon,
    String? title,
    String? cancelText,
    Function()? onConfirm,
    Function()? onCancel,
    required String content,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          icon: icon,
          title: Text(title ?? ''),
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
                onConfirm?.call();
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
