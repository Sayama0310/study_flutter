class Haiku {
  final String haiku;
  final String author;
  final String imageUrl;

  const Haiku({
    required this.haiku,
    required this.author,
    required this.imageUrl,
  });
}

var haikuList = <Haiku>[
  const Haiku(
    haiku: '赤い椿　白い椿と　落ちにけり',
    author: '河東碧梧桐',
    imageUrl:
        'https://images.pexels.com/photos/5780705/pexels-photo-5780705.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ),
  const Haiku(
    haiku: '分け入っても　分け入っても　青い山',
    author: '種田山頭火',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/3/36/Forest01s2048.jpg',
  ),
  const Haiku(
    haiku: '梅一輪　一輪ほどの　暖かさ',
    author: '松尾芭蕉',
    imageUrl:
        'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQ-UOqh-ecI3xDAoTQxS3lMuTjjFx2h1QFQV4knTl0lv2AezETtR-ft_ImU8T3ocV2nAGCZtDYlVfEgRfg',
  ),
  const Haiku(
    haiku: '松島や　ああ松島や　松島や',
    author: '田原坊',
    imageUrl: 'https://nihonsankei.jp/matsu/matsu_kanko_i1.jpg',
  ),
  const Haiku(
    haiku: '痰一斗　糸瓜の水も　間に合わず',
    author: '正岡子規',
    imageUrl:
        'https://www.hyponex.co.jp/plantia/wp/wp-content/uploads/2020/07/6-1-min.jpg',
  ),
];
