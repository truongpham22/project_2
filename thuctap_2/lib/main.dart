import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_2/api.dart';

import 'package:project_2/signUp.dart';

import 'input.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Login(),
    ),
  );
}

class Login extends StatefulWidget {
  // const Login({super.key});
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  widgetLogin bc = widgetLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(18, 5, 12, 12),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.blue, fontSize: 34),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 18),
            child: const Text(
              'welcome back. Please Login!',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(18, 25, 18, 18),
            child: formField(
              controller: bc.emailCtr,
              name: 'Email',
              text: 'Nhập Email',
              icon: Icons.mail,
              onChanged: (value) {
                //print('$value');
                setState(() {
                  bc.onEmailChange();
                });
              },
            ),
          ),
          if (bc.emailErrorMessage.isNotEmpty)
            Container(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                bc.emailErrorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
          Container(
            margin: const EdgeInsets.fromLTRB(18, 25, 18, 18),
            child: formField(
              controller: bc.passCtr,
              name: 'Pass',
              text: 'Nhập Pass',
              icon: Icons.mail,
              onChanged: (value) {
                setState(() {
                  bc.onPassChange();
                });
              },
            ),
          ),
          if (bc.passErrorMessage.isNotEmpty)
            Container(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                bc.passErrorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 9),
            child: Center(child: button('Login', 22)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            child: const Center(
              child: Text(
                'forgot your password',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(
                    255,
                    182,
                    180,
                    180,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: const Center(
                child: Text(
              'or Connect with',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(
                  255,
                  182,
                  180,
                  180,
                ),
              ),
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loginElse('Facebook', Colors.blue, Icons.facebook),
              const SizedBox(
                width: 20,
              ),
              loginElse('Twister', const Color.fromARGB(255, 25, 98, 159),
                  Icons.people_outline),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, right: 20),
                child: const Text(
                  'Don\'t have account?',
                  style: TextStyle(
                    color: Color.fromARGB(
                      255,
                      182,
                      180,
                      180,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }

  Widget formField(
      {required String name,
      required TextEditingController controller,
      required String text,
      required IconData icon,
      required ValueChanged<String>? onChanged}) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: name,
            hintText: text,
            prefixIcon: Icon(icon),
          ),
        ),
      ],
    );
  }

  Widget button(String text, double n) {
    return Container(
      width: 200,
      height: 40,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 168, 193, 224),
            spreadRadius: 0,
            blurRadius: 26,
            offset: Offset(0, 9),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (bc.emailCtr.text.isEmpty) {
              bc.emailErrorMessage = 'empty';
              return;
            } else if (bc.passCtr.text.isEmpty) {
              bc.passErrorMessage = 'empty';
              return;
            } else {
              API.ins.login(bc.emailCtr.text, bc.passCtr.text, context);
              return;
            }
          });
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: n),
        ),
      ),
    );
  }

  Widget loginElse(String text, Color color, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 146, 176, 212),
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(120, 42),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(color),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(8))),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
