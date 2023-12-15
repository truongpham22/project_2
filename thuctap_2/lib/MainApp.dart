import 'package:flutter/material.dart';
import 'package:project_2/SplashScreen.dart';
import 'package:project_2/api.dart';

import 'package:project_2/signUp.dart';
import 'package:provider/provider.dart';

import 'input.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => widgetLogin(),
    child: myApp(),
  ));
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue.shade300),
          )),
          bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Color.fromARGB(255, 198, 161, 150),
              elevation: 0),
          appBarTheme: const AppBarTheme(color: Colors.brown),
          colorScheme: const ColorScheme.dark(background: Colors.brown),
          scaffoldBackgroundColor: Colors.brown,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromARGB(255, 252, 151, 144)),
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
            iconSize: MaterialStatePropertyAll(30),
          )),
          bottomAppBarTheme: const BottomAppBarTheme(
            color: Color.fromARGB(255, 181, 134, 117),
          )),
      darkTheme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        )),
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Color.fromARGB(255, 56, 55, 55)),
        appBarTheme: const AppBarTheme(color: Colors.black),
        colorScheme: const ColorScheme.dark(background: Colors.black),
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: Provider.of<widgetLogin>(context).checkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      home: SplashScreen(),
    );
  }
}

class Login extends StatefulWidget {
  // const Login({super.key});
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

widgetLogin bc = widgetLogin();

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    bc = Provider.of<widgetLogin>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login Form'),
        automaticallyImplyLeading: false,
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
                style: const TextStyle(color: Colors.red),
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
                style: const TextStyle(color: Colors.red),
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
      // decoration: const BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: Color.fromARGB(255, 168, 193, 224),
      //       spreadRadius: 0,
      //       blurRadius: 26,
      //       offset: Offset(0, 9),
      //     )
      //   ],
      // ),
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
      // decoration: const BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: Color.fromARGB(255, 146, 176, 212),
      //       spreadRadius: 0,
      //       blurRadius: 20,
      //       offset: Offset(0, 5),
      //     )
      //   ],
      // ),
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
