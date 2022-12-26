import 'package:flutter/material.dart';
import 'package:study_flutter/widget_samples/listview/src/layout/listview_layout.dart';

// ListViewの使い方について学習

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        // Add the 5 lines from here...
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ListviewLayout(),
    );
  }
}
