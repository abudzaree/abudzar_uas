import 'package:abuzar/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Projek());
}

class Projek extends StatelessWidget {
  const Projek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
