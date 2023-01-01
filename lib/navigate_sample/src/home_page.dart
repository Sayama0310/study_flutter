import 'package:flutter/material.dart';
import 'package:study_flutter/navigate_sample/src/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      // TODO : bottomNavigationBarでページ遷移をしたい
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [],
      // ),
    );
  }
}
