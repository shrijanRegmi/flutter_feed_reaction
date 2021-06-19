import 'package:example/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Example",
      debugShowCheckedModeBanner: false,
      home: Material(
        child: HomeScreen(),
      ),
    );
  }
}
