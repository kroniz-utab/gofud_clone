import 'package:flutter/material.dart';
import 'package:gofud_clone/design/theme_color.dart';
import 'package:gofud_clone/main_screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gofud Clone',
      theme: ThemeData(
        primarySwatch: primaryTheme,
        fontFamily: 'Roboto',
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
