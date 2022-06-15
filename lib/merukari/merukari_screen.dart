import 'package:flutter/material.dart';

class GoodsInfo {
  final String imagePath;
  final String title;
  final String price;
  final String compassion;

  GoodsInfo({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.compassion,
  });
}

class MerukariScreen extends StatelessWidget {
  MerukariScreen({Key? key}) : super(key: key);
  static const lightGray = Color.fromRGBO(231, 231, 231, 1);

  final List<GoodsInfo> _dummyGoodsData = [
    GoodsInfo(
      imagePath: 'images/カメラ画像.png',
      title: 'NikonD5500',
      price: '¥51,000',
      compassion: '446人が探しています',
    ),
    GoodsInfo(
      imagePath: 'images/カメラ画像.png',
      title: 'NikonD5500',
      price: '¥51,000',
      compassion: '446人が探しています',
    ),
    GoodsInfo(
      imagePath: 'images/カメラ画像.png',
      title: 'NikonD5500',
      price: '¥51,000',
      compassion: '446人が探しています',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton.extended(
          elevation: 5,
          shape: const CircleBorder(),
          backgroundColor: const Color.fromRGBO(195, 90, 75, 1),
          onPressed: () {},
          label: SizedBox(
            width: 100,
            height: 50,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(
                    Icons.photo_camera,
                    size: 23,
                  ),
                ),
                Text(
                  '出品',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
          ), //テキスト//アイコン
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "出品",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(context) {
    //ここに定数を作って、各Containerのwidthで使う。
    final bottomWidths = (MediaQuery.of(context).size.width - 60) / 4;
    //Listviewbuilder入れて出たエラー、下記2行で解決
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(239, 239, 239, 1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset('images/メルカリ_トップ画.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: const [
                    Text(
                      '出品へのショートカット',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 85,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: bottomWidths,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: lightGray,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    '写真を撮る',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: bottomWidths,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: lightGray,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Icon(
                                    Icons.photo_library_outlined,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    'アルバム',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: bottomWidths,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: lightGray,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Icon(
                                    Icons.qr_code,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    ' バーコード\n(本・コスメ)',
                                    style: TextStyle(fontSize: 10, height: 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: bottomWidths,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: lightGray,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Icon(
                                    Icons.description_outlined,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    '下書き一覧',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: lightGray),
                              ),
                            ),
                            child: ListTile(
                              title: const Text(
                                '売れやすい持ち物',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text(
                                '使わないモノを出品してみよう！',
                                style: TextStyle(fontSize: 12),
                              ),
                              trailing: SizedBox(
                                width: 115,
                                child: Row(
                                  children: const [
                                    Text(
                                      'すべて見る ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.blue),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        LimitedBox(
                          maxHeight: 500,
                          child: ListView.builder(
                            itemCount: _dummyGoodsData.length,
                            itemBuilder: (BuildContext context, int index) {
                              final currentGoodsData = _dummyGoodsData[index];
                              return Container(
                                height: 80,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: lightGray),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(currentGoodsData.imagePath),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              currentGoodsData.title,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              currentGoodsData.price,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.local_fire_department,
                                                  color: Colors.blue,
                                                  size: 20,
                                                ),
                                                Text(
                                                  currentGoodsData.compassion,
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color.fromRGBO(
                                                195, 90, 75, 1),
                                          ),
                                          child: const Text(
                                            '出品する',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
      unselectedFontSize: 12,
      selectedFontSize: 12,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            size: 33,
          ),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_outlined,
            size: 33,
          ),
          label: 'お知らせ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.photo_camera,
            size: 33,
          ),
          label: '出品',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.qr_code_2_outlined,
            size: 33,
          ),
          label: 'メルペイ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.perm_identity_outlined,
            size: 33,
          ),
          label: 'マイページ',
        ),
      ],
    );
  }
}
