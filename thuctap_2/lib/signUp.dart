import 'package:flutter/material.dart';

import 'api.dart';
import 'main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String errorName = '';
  String errorMail = '';
  String errorPass = '';
  String errorRepass = '';

  final emailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final repassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('SignUp Form'),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(18, 5, 12, 12),
              child: const Text(
                'Sign up!',
                style: TextStyle(color: Colors.blue, fontSize: 34),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 18),
              child: const Text(
                'Create an account here!!!',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 25, 18, 18),
              child: formField(
                nameCtrl,
                'Username',
                'Nhập username',
                Icons.people,
                (value) {
                  // print('$value');
                  setState(() {
                    errorName = nameCtrl.text.isEmpty ? 'name empty' : '';
                  });
                },
              ),
            ),
            if (errorName.isNotEmpty)
              Container(
                margin: EdgeInsets.only(left: 18),
                child: Text(
                  errorName,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
              child: formField(emailCtrl, 'Email', 'Nhập Email', Icons.email,
                  (value) {
                setState(() {
                  errorMail = emailCtrl.text.isEmpty ? 'email empty' : '';
                });
              }),
            ),
            if (errorMail.isNotEmpty)
              Container(
                margin: EdgeInsets.only(left: 18),
                child: Text(
                  errorMail,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
              child: formField(
                  passCtrl, 'Password', 'Nhập Password', Icons.shield_outlined,
                  (value) {
                setState(() {
                  errorPass = passCtrl.text.isEmpty ? 'pass empty' : '';
                });
              }),
            ),
            if (errorPass.isNotEmpty)
              Container(
                margin: EdgeInsets.only(left: 18),
                child: Text(
                  errorPass,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
              child: formField(
                  repassCtrl, 'Repass', 'Nhập Repass', Icons.shield, (value) {
                setState(() {
                  errorRepass = repassCtrl.text.isEmpty ? 'Repass empty' : '';
                });
              }),
            ),
            if (errorRepass.isNotEmpty)
              Container(
                margin: EdgeInsets.only(left: 18),
                child: Text(
                  errorRepass,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Center(
                child: button('Sign Up', 22),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('already have an account'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: const Text(
                      'SignIn',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget formField(TextEditingController controller, String name,
      String content, IconData icon, ValueChanged<String>? onChanged) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: name,
        hintText: content,
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget button(String text, double n) {
    return Container(
      width: 200,
      height: 40,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 168, 193, 224),
          spreadRadius: 0,
          blurRadius: 26,
          offset: Offset(0, 9),
        )
      ]),
      child: ElevatedButton(
          style: ButtonStyle(),
          onPressed: () {
            API.ins.register(emailCtrl.text, nameCtrl.text, passCtrl.text);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: n),
          )),
    );
  }
}
