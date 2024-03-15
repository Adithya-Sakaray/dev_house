import 'package:dev_house/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          color: Colors.white, // Set the background color of the app bar
          // Define other app bar styles here
        ),
      ),
      title: 'Job Portal',
      home: const HomeScreen(),
    );
  }
}
