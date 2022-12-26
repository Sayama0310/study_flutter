import 'package:flutter/material.dart';
import 'package:study_flutter/widget_samples/listview/src/pages/listview_basic_home_page.dart';

import '../pages/lazy_load_list_page.dart';

class ListviewLayout extends StatefulWidget {
  const ListviewLayout({Key? key}) : super(key: key);

  @override
  State<ListviewLayout> createState() => _ListviewLayoutState();
}

class _ListviewLayoutState extends State<ListviewLayout> {
  static const _pages = [
    ListviewBasicHomePage(),
    LazyLoadListPage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listview Sample')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hotel),
            label: 'Lazy',
          ),
        ],
      ),
    );
  }
}
