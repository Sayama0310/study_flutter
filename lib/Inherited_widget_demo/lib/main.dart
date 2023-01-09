import 'package:flutter/material.dart';

// providerの理解の前に[InheritedWidget]を勉強しておくと、段階的に必要性がわかるっぽいので
// 勉強してみる。

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
