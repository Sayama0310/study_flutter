import 'package:flutter/material.dart';
import 'package:study_flutter/sliver_app_bar/src/component/haiku_panel.dart';
import 'package:study_flutter/sliver_app_bar/src/dataset/haiku.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({super.key});

  @override
  State<StatefulWidget> createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // TODO physicsは何を設定するのか？
        // c.f. https://medium.com/@roaakdm/flutter-scrollphysics-variations-use-cases-da87528cc6c1
        physics: const BouncingScrollPhysics(),
        // [Widget-Point] ScaffoldのappBarプロパティは使わずにbodyにCustomScrollViewを設定して、
        // その中にSliverAppBarを並べる。
        // その下にSliverListやSliverGridなどを下に並べていけば良い。
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blueAccent.withOpacity(0.3),
            // trueであれば一番上に戻らなくても、上にスクロールするだけでヘッダーが出現します。
            floating: true,
            // trueであれば完全に隠すのではなく、タイトルだけを一行分残して表示します。
            pinned: true,
            // trueであればスクロールでヘッダーが見え隠れしたりせず、固定されます。
            snap: true,
            // AppBarをオーバースクロールした時に伸縮するかを設定。flexibleSpaceの中のstretchModesもみて！
            stretch: false,
            expandedHeight: 180,
            toolbarHeight: 60,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('俳句一覧'),
              // [Widget-Point] stretchがtrueの時の振る舞いをかく。
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle
              ],
              // [Widget-Point] widthとheightでのみContainerではなくSizedBoxの方が描画コストが低いらしい。
              background: SizedBox(
                width: double.infinity,
                child: Image.network(
                  'https://images.pexels.com/photos/1440476/pexels-photo-1440476.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return HaikuPanel(haiku: haikuList[index]);
              },
              childCount: haikuList.length,
            ),
          )
        ],
      ),
    );
  }
}
