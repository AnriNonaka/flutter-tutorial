import 'package:flutter/material.dart';

class MovieInfo {
  final String imagePath;
  final String iconPath;
  final String title;
  final String subTitle;

  MovieInfo({
    required this.imagePath,
    required this.iconPath,
    required this.title,
    required this.subTitle,
  });
}

class YoutubeScreen extends StatelessWidget {
  YoutubeScreen({Key? key}) : super(key: key);

  final List<MovieInfo> _dummyMovieData = [
    MovieInfo(
        imagePath: 'images/動画画像.png',
        iconPath: 'images/ARASHIロゴ.png',
        title: '"This is ARASHI LIVE 2020.12.31"Digest Movie',
        subTitle: 'ARASHI・127万回視聴・1日前'),
    MovieInfo(
        imagePath: 'images/動画画像.png',
        iconPath: 'images/ARASHIロゴ.png',
        title: '"This is ARASHI LIVE 2020.12.31"Digest Movie',
        subTitle: 'ARASHI・127万回視聴・1日前'),
    MovieInfo(
        imagePath: 'images/動画画像.png',
        iconPath: 'images/ARASHIロゴ.png',
        title: '"This is ARASHI LIVE 2020.12.31"Digest Movie',
        subTitle: 'ARASHI・127万回視聴・1日前'),
    MovieInfo(
        imagePath: 'images/動画画像.png',
        iconPath: 'images/ARASHIロゴ.png',
        title: '"This is ARASHI LIVE 2020.12.31"Digest Movie',
        subTitle: 'ARASHI・127万回視聴・1日前'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: SizedBox(
        height: 150,
        width: 150,
        child: Image.asset(
          'images/YOUTUBEロゴ.png',
        ),
      ),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          constraints: const BoxConstraints(
            maxWidth: 40,
          ),
          onPressed: () {},
          icon: const Icon(Icons.cast, color: Colors.white),
        ),
        IconButton(
          constraints: const BoxConstraints(
            maxWidth: 40,
          ),
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: Colors.white),
        ),
        IconButton(
          constraints: const BoxConstraints(
            maxWidth: 40,
          ),
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 8,
          ),
          child: Container(
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple,
            ),
            child: const Center(child: Text('T')),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Wrap(
              // 「crossAxisCount: 2」使ってたけど、wrapで囲むために_buildCategoryメソッド作った。
              alignment: WrapAlignment.start,
              children: <Widget>[
                _buildCategory(
                    context, Colors.red, Icons.local_fire_department, '急上昇'),
                _buildCategory(context, Colors.teal, Icons.music_note, '音楽'),
                _buildCategory(
                    context, Colors.brown, Icons.sports_esports, 'ゲーム'),
                _buildCategory(context, Colors.blueAccent, Icons.feed, 'ニュース'),
                _buildCategory(context, Colors.green, Icons.lightbulb, '学び'),
                _buildCategory(context, Colors.orange, Icons.lightbulb, 'ライブ'),
                _buildCategory(context, Colors.cyan, Icons.sports, 'スポーツ'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: const [
                  Text(
                    '急上昇動画',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            ListView.builder(
              //下記2行追加してエラー解決
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              //_dummyMovieDataの数の並びができる
              itemCount: _dummyMovieData.length,
              itemBuilder: (BuildContext context, int index) {
                final currentMovieData = _dummyMovieData[index];
                return Card(
                  color: Colors.black38,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Image.asset(currentMovieData.imagePath),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(currentMovieData.iconPath),
                          ),
                          title: Text(
                            currentMovieData.title,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            currentMovieData.subTitle,
                            style: const TextStyle(
                              color: Colors.white38,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, color: Colors.white),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore, color: Colors.white),
          label: '検索',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle_outline,
            color: Colors.white,
            size: 45,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions, color: Colors.white),
          label: '登録チャンネル',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library, color: Colors.white),
          label: 'ライブラリ',
        ),
      ],
    );
  }

  //
  Widget _buildCategory(
      BuildContext context, Color color, IconData icon, String label) {
    return SizedBox(
      //カードを2個に並べる「crossAxisCount: 2」じゃないやり方
      width: (MediaQuery.of(context).size.width - 16) / 2,
      child: Card(
        color: color,
        //cardの中のアイコンとTextを中央・左端にやる時は、Rowを使ったらできた
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
