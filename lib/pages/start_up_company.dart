import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// https://docs.flutter.dev/get-started/codelab?tab=voiceover
// https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2
// 公式ドキュメントに載っていたサンプルアプリの実装。以下の機能の学習。
//   * ListViewを使って無限スクロールとLazyロード。
//   * StatefulWidgetを使ってみる。
//   * クリックできるボタン。
//   * Navigateの実装。
//   * Themeの変更。
// 以下の機能はちょっとよく分からなかった。
//   * ScreenReaderの使用。

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  void _pushSaved() {
    Navigator.of(context).push(
      // Add lines from here...
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ), // ...to here.
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: /*1*/ (context, i) {
            if (i.isOdd) return const Divider();
            /*2*/
            final index = i ~/ 2; /*3*/
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10)); /*4*/
            }
            final alreadySaved = _saved.contains(_suggestions[index]);
            return ListTile(
              title: Text(
                _suggestions[index].asPascalCase,
                style: _biggerFont,
              ),
              trailing: Icon(
                // NEW from here ...
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
                semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
              ),
              onTap: () {
                // NEW from here ...
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(_suggestions[index]);
                  } else {
                    _saved.add(_suggestions[index]);
                  }
                }); // to here.
              },
            );
          },
        ),
      ),
    );
  }
}
