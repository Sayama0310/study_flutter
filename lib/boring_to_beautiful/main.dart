import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/boring_to_beautiful/src/shared/app.dart';
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
  // TODO WidgetsFlutterBindingについて調査
  // [Difficult-Point] WidgetsBindingについての理解が要求されるが、コメント文にするには厳しいのでドキュメントとしてまとめておきたい。
  // runAppの前にFlutterアプリの機能を利用する場合にはWidgetsFlutterBinding.ensureInitialized()をコールする必要があるらしい。
  WidgetsFlutterBinding.ensureInitialized();

  // もしデスクトップ向けに起動していた時は、Windowの最小幅、最小高さなどを設定する。
  // [Package-Point] dart.ioのPlatformでもプラットフォームを判定できたりするらしいが、かつてのバージョンでエラーが出ていたみたい。
  // その回避策としてUniversalPlatformが使えるらしい。しかしいまだにdart.ioのPlatformでエラーが出るかは分からない。
  // https://api.flutter.dev/flutter/dart-io/Platform-class.html
  if (UniversalPlatform.isDesktop) {
    setDesktopWindow();
  }

  runApp(const MyApp());
}
