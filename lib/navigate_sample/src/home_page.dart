import 'package:flutter/material.dart';
import 'package:study_flutter/navigate_sample/src/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigate Sample')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is home page.'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // [Flutter-Point] Navigator.pushでページ遷移ができる
                  // このメソッドを使うと、AppBarの部分に＜という戻るボタンが自動的についてくれる
                  Navigator.push(
                    context,
                    // [Flutter-Point] MaterialPageRouteというPageRouteクラスを使うとページ遷移のアニメーションがいい感じにつく
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: const Text('Next Page'),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            activeIcon: Icon(Icons.book_online),
            label: 'Book',
            tooltip: "This is a Book Page",
            backgroundColor: Colors.amber, // TODO Themeはどこで適用されるの？
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            activeIcon: Icon(Icons.business_center),
            label: 'Business',
            tooltip: "This is a Business Page",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            activeIcon: Icon(Icons.school_outlined),
            label: 'School',
            tooltip: "This is a School Page",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings_outlined),
            label: 'Settings',
            tooltip: "This is a Settings Page",
            backgroundColor: Colors.amber,
          ),
        ],
        backgroundColor: Colors.amber,
        enableFeedback: true,
        iconSize: 20,
      ),
    );
  }
}
