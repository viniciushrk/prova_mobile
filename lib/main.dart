import 'package:flutter/material.dart';
import 'package:prova_mobile/pages/Index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provinha app',
      debugShowCheckedModeBanner: false,
      home: const Index(),
    );
  }
}
