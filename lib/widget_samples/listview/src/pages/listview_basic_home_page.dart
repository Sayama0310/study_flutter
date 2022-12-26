import 'package:flutter/material.dart';

final List<String> entries = <String>['A', 'B', 'C', 'D'];
final List<int> colorCodes = <int>[600, 500, 100, 20];

class ListviewBasicHomePage extends StatelessWidget {
  const ListviewBasicHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // [Widget-Point] Columnは縦に目一杯の幅をとる。そのため、ListViewを中にそのまま入れることはできない。
        // Expandedで囲うなどする。
        // c.f. https://stackoverflow.com/questions/45669202/how-to-add-a-listview-to-a-column-in-flutter
        Expanded(
          child: Center(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: const Center(child: Text('Entry A')),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[500],
                  child: const Center(child: Text('Entry B')),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[100],
                  child: const Center(child: Text('Entry C')),
                ),
              ],
            ),
          ),
        ),
        // [Widget-Point]  ListView.builderにより配列を使って要素を書くことができる。
        Expanded(
          child: Center(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  color: Colors.amber[colorCodes[index]],
                  child: Center(child: Text('Entry ${entries[index]}')),
                );
              },
            ),
          ),
        ),
        // [Widget-Point] ListView.separatedでリスト要素の間（separator）を実装することができる。
        Center(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        )
      ],
    );
  }
}
