import 'package:diseno_1/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'basic-design',
      routes: {
        'basic-design': (_) => const BasicDesignScreen()
        },
      );
  }
}