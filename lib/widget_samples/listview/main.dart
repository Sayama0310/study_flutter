import 'package:flutter/material.dart';
import 'package:study_flutter/widget_samples/listview/src/list_view_sample.dart';

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
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const ListViewPage(),
    );
  }
}
