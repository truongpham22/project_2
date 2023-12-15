import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/MainApp.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Login()), // Chuyển đến màn hình chính
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: GradientText(
          'PiepTeam X Noel',
          colors: [
            Colors.red.shade400,
            Colors.yellow.shade900,
          ],
          style: GoogleFonts.rubikBubbles(fontSize: 40),
        ),
      ),
    );
  }
}
