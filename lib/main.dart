import 'package:employee_directory/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Directory',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomeScreen(),
    );
  }
}
