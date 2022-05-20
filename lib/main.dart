import 'package:flutter/material.dart';
import 'package:flutter_final_app/screens/detail.dart';
import 'package:flutter_final_app/screens/form.dart';
import 'package:flutter_final_app/screens/home.dart';
import 'package:flutter_final_app/screens/list.cinema.dart';
import 'package:flutter_final_app/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhanTuanAnh - 18DH110184',
      theme: ThemeData(primaryColor: kLightColor),
      initialRoute: '$HomeScreen',
      routes: {
        '$HomeScreen': (context) => const HomeScreen(),
        '/add': (context) => const FormScreen(),
        '/update': (context) => const FormScreen(),
        '$ListAllScreen': (context) => const ListAllScreen(),
        '$DetailScreen': (context) => const DetailScreen()
      },
    );
  }
}
