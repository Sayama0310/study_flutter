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
      // [Widget-Point] bottomNavigationBarの使い方についてざっくりまとまった記事があった
      // c.f. https://zenn.dev/urasan/articles/5bb85a54fb23fb
      // [Flutter-Point] RiverpodでBottomNavigationBarを実装してみるという記事があった
      // c.f. https://zenn.dev/joo_hashi/articles/ee8037bdeb7b4b
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            activeIcon: Icon(Icons.book_online),
            label: 'Book',
            tooltip: "This is a Book Page",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            activeIcon: Icon(Icons.business_center),
            label: 'Business',
            tooltip: "This is a Business Page",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            activeIcon: Icon(Icons.school_outlined),
            label: 'School',
            tooltip: "This is a School Page",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings_outlined),
            label: 'Settings',
            tooltip: "This is a Settings Page",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade200,
        selectedItemColor: Theme.of(context).bottomAppBarColor,
        enableFeedback: true,
        iconSize: 20,
      ),
    );
  }
}
