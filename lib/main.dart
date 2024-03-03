import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/input_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/input': (context) => const InputPage(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}
