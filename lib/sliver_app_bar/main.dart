import 'package:flutter/material.dart';
import 'package:study_flutter/sliver_app_bar/src/page/sliver_app_bar_page.dart';

// 『現場で使えるFlutter開発入門』2-5 SliverAppBar
// 少し凝った作りのヘッダーなどが使えるSliverAppBarなどを使うサンプルがあったので実際に使ってみる。
// 以下の機能を学習
//   * Sliver系のWidget
//   * 細かなデザインテクニック

void main() {
  runApp(const MyApp());
}

// TODO : SliverAppを使ってLayoutを調整するには同志行ったら良いか？
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sliver App Bar Sample',
      home: SliverAppBarPage(),
    );
  }
}
