import 'package:bmi_calculator/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const IMCApplication());
}

class IMCApplication extends StatelessWidget {
  const IMCApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const HomeScreen(),
    );
  }
}
