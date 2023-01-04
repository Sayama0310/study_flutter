import 'package:flutter/material.dart';
import 'package:study_flutter/navigate_sample/src/home_page.dart';

// 『基礎から学ぶFlutter』
// 以下を学習
//   * Navigatorによるページ遷移について

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Sample App',
      theme: ThemeData(
        primaryColor: Colors.amber,
        primarySwatch: Colors.amber,
        bottomAppBarColor: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}
