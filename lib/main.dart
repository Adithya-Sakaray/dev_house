import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Portal',
      theme: ThemeData(
        primaryColor: const Color(0xFF35424A), // Turquoise
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF40E0D0)),
      ),
      home: const HomePage(),
    );
  }
}
