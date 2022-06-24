import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/youtube/youtube_client_state_notifier.dart';

import 'model/youtube_item.dart';

class MovieInfo {
  MovieInfo({
    required this.imagePath,
    required this.iconPath,
    required this.title,
    required this.subTitle,
  });

  final String imagePath;
  final String iconPath;
  final String title;
  final String subTitle;
}

//StatelessWidget →変更
class YoutubeTopScreen extends ConsumerWidget {
  const YoutubeTopScreen({super.key});

  @override
  //変更(御作法で)
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(youtubeClientStateNotifier);
    //youtube_client_state_notifier.dartの
    // 「state = state.copyWith(isLoading: true)
    // のフラグを活用して、読み込んでる時だけインジケータ出す
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: _buildBody(context, state.youtubeItems),
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

  Widget _buildBody(BuildContext context, List<YoutubeItem> youtubeItems) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Wrap(
                // 「crossAxisCount: 2」使ってたけど、wrapで囲むために_buildCategoryメソッド作った。
                children: <Widget>[
                  _buildCategory(
                    context,
                    Colors.red,
                    Icons.local_fire_department,
                    '急上昇',
                  ),
                  _buildCategory(context, Colors.teal, Icons.music_note, '音楽'),
                  _buildCategory(
                    context,
                    Colors.brown,
                    Icons.sports_esports,
                    'ゲーム',
                  ),
                  _buildCategory(
                    context,
                    Colors.blueAccent,
                    Icons.feed,
                    'ニュース',
                  ),
                  _buildCategory(context, Colors.green, Icons.lightbulb, '学び'),
                  _buildCategory(
                    context,
                    Colors.orange,
                    Icons.lightbulb,
                    'ライブ',
                  ),
                  _buildCategory(context, Colors.cyan, Icons.sports, 'スポーツ'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
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
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: youtubeItems.length,
                itemBuilder: (context, index) {
                  final currentMovieData = youtubeItems[index];
                  return Card(
                    color: Colors.black38,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Image.network(currentMovieData.imagePath ?? ''),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: SizedBox(
                                width: 37,
                                child: Image.network(
                                  currentMovieData.iconPath ?? '',
                                ),
                              ),
                            ),
                            title: Text(
                              currentMovieData.title ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              '${currentMovieData.channelName ?? ''}・'
                              '${currentMovieData.numOfViews.toString()}万回再生・'
                              '${currentMovieData.daysAgo.toString()}日前',
                              style: const TextStyle(color: Colors.white38),
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

  Widget _buildCategory(
    BuildContext context,
    Color color,
    IconData icon,
    String label,
  ) {
    return SizedBox(
      //カードを2個に並べる「crossAxisCount: 2」じゃないやり方
      width: (MediaQuery.of(context).size.width - 16) / 2,
      child: Card(
        color: color,
        //cardの中のアイコンとTextを中央・左端にやる時は、Rowを使ったらできた
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
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
