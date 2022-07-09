// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mongonav/routes/connectRoute.dart';
import 'package:mongonav/routes/databasesRoute.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const ConnectRoute(),
        // 'databases': (context) => const DatabaseRoute(),
      },
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff00A35C),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff00A35C)),
          ),
        ),
      ),
    );
  }
}
