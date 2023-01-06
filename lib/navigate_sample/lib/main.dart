import 'package:flutter/material.dart';

import 'page/home_page.dart';

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
        primarySwatch: Colors.amber,
        bottomAppBarColor: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}
