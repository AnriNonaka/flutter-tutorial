import 'package:badges/badges.dart';
import 'package:flutter/material.dart';


class ResidenceScreen extends StatelessWidget {
  const ResidenceScreen({Key? key}) : super(key: key);
  //これを作ったら「lightGray」をどこからでも呼び出せる。
  //1メソッド内で書くことも可能。今回は多数のメソッドで使いたいからここに。
  static const lightGray = Color.fromRGBO(249, 248, 246, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton.extended(
          shape: const CircleBorder(),
          backgroundColor: Colors.teal,
          onPressed: () {},
          label: SizedBox(
            width: 100,
            height: 50,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(
                    Icons.search,
                    size: 25,
                  ),
                ),
                Text(
                  '物件',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ), //テキスト//アイコン
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    //何回も使うカラーをここでメンバ変数にする（プライベートにしてたら警告でたので「_」を外しました。）

    return SingleChildScrollView(
      //SafeAreaで囲ってあげるとpadding:を設定しなくてもいい感じにしてくれる
      child: SafeArea(
        child: Container(
          color: lightGray,
          child: Column(
            children: [
              Material(
                elevation: 6.0,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 3, right: 7),
                      child: Chip(
                        label: Text(
                          'カウルのおすすめ',
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Badge(
                      badgeContent: const Text(
                        '1',
                        style: TextStyle(color: Colors.white),
                      ),
                      position: BadgePosition.topEnd(top: -4, end: -4),
                      child: const Chip(
                        label: Text('リフォーム済みの'),
                      ),
                    ),
                    const Spacer(), //間をあけれる
                    const Padding(
                      padding: EdgeInsets.only(right: 8, bottom: 3),
                      child: Icon(
                        Icons.add_circle,
                        size: 45,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    'カウルのおすすめ    ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Text(
                                  '新着3件',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Text(
                                    '編集',
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.teal,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Card(
                              elevation: 0,
                              color: lightGray,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: const [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 5.0),
                                            child: Icon(
                                              Icons.train,
                                              size: 16,
                                            ),
                                          ),
                                          Text(
                                            '東京駅・品川駅・川崎駅・横浜駅・目黒駅・恵比寿駅・渋谷駅・',
                                            style: TextStyle(fontSize: 10.7),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 5.0),
                                            child: Icon(
                                              Icons.paid,
                                              size: 16,
                                            ),
                                          ),
                                          Text(
                                            '下限なし 〜2,000万円',
                                            style: TextStyle(fontSize: 10.7),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 5.0),
                                            child: Icon(
                                              Icons.error_outline,
                                              size: 16,
                                            ),
                                          ),
                                          Text(
                                            '1R 〜 4LDK/10㎡以上/徒歩20分',
                                            style: TextStyle(fontSize: 10.7),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                'images/物件写真.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 0,
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Rising place川崎',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: Row(
                                        children: const [
                                          Text(
                                            '2,000万円',
                                            style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Icon(
                                            Icons.train,
                                            size: 16,
                                          ),
                                        ),
                                        Text(
                                          '京急本線 京急川崎駅 より 徒歩9分',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Icon(
                                            Icons.house,
                                            size: 16,
                                          ),
                                        ),
                                        Text(
                                          '1K / 21.24㎡ 南西向き',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Icon(
                                            Icons.apartment,
                                            size: 16,
                                          ),
                                        ),
                                        Text(
                                          '2階/15年建 築5年',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  //ここに最初SizedBoxで「width: 170」を指定していた→子にしていたContainerで指定できた。→padding削除
                                  child: Container(
                                    width: 170,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0,
                                              left: 20,
                                              right: 19,
                                              bottom: 8),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          '興味なし',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0,
                                            left: 20,
                                            right: 14,
                                            bottom: 8),
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        'お気に入り',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                'images/物件写真.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 0,
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Rising place川崎',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: Row(
                                        children: const [
                                          Text(
                                            '2,000万円',
                                            style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Icon(
                                            Icons.train,
                                            size: 16,
                                          ),
                                        ),
                                        Text(
                                          '京急本線 京急川崎駅 より 徒歩9分',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Icon(
                                            Icons.house,
                                            size: 16,
                                          ),
                                        ),
                                        Text(
                                          '1K / 21.24㎡ 南西向き',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Icon(
                                            Icons.apartment,
                                            size: 16,
                                          ),
                                        ),
                                        Text(
                                          '2階/15年建 築5年',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: 170,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 8.0,
                                                left: 20,
                                                right: 19,
                                                bottom: 8),
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            '興味なし',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 170,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0,
                                              left: 20,
                                              right: 14,
                                              bottom: 8),
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          'お気に入り',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.teal,
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 40,
          ),
          label: 'ホーム',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, size: 40),
          label: 'お気に入り',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const Icon(Icons.mode_comment_outlined, size: 40),
              Positioned(
                right: 0,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  constraints: const BoxConstraints(
                    minHeight: 12,
                    minWidth: 12,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '1',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          label: 'メッセージ',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 40),
          label: 'マイページ',
        ),
      ],
    );
  }
}
