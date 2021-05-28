import 'package:flutter/material.dart';
import './input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C20),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFEB1555)),
        scaffoldBackgroundColor: Color(0xFF090C20),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
          headline6: TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}
