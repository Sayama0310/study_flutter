import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

// https://codelabs.developers.google.com/codelabs/flutter-boring-to-beautiful#0
// https://github.com/flutter/codelabs/tree/master
// FlutterのCodelabsというリポジトリにサンプルアプリがたくさんあったので、こちらを実装してみた。
// 以下の機能の学習。
//   * プラットフォーム横断的に美しく使いやすいアプリの書き方。
//   * アプリ内のテキストがユーザーエクスペリエンスを高めるためのデザイン方法。
//   * 正しい色の選び方、ウィジェットのカスタマイズ、独自のテーマの作り方、そして素早く簡単にダークモードを実装する方法。
//   * クロスプラットフォーム対応のアプリを構築する方法。
//   * どんなスクリーンでも良く見えるアプリの構築の仕方。
//   * 動きをつけてポップにする方法。

Future setDesktopWindow() async {
  await DesktopWindow.setMinWindowSize(const Size(400, 400));
  await DesktopWindow.setWindowSize(const Size(1300, 900));
}

void main() {
  // TODO : これは何をやっているのか？
  WidgetsFlutterBinding.ensureInitialized();

  // もしデスクトップ向けに起動していた時は、Windowの最小幅、最小高さなどを設定する。
  if (UniversalPlatform.isDesktop) {
    setDesktopWindow();
  }

  // runApp();
}
