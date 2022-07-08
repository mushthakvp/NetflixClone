import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/main_page/main_page_scree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: blackColor),
        scaffoldBackgroundColor: blackColor,
        backgroundColor: blackColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: whiteColor),
          bodyText2: TextStyle(color: whiteColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPageScreen(),
    );
  }
}
