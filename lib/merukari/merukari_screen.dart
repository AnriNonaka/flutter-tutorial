import 'package:flutter/material.dart';

class MerukariScreen extends StatelessWidget {
  const MerukariScreen({Key? key}) : super(key: key);
  static const lightGray = Color.fromRGBO(231, 231, 231, 1);

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
    return SingleChildScrollView(
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
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 75,
                    height: 85,
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
                    width: 75,
                    height: 85,
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
                    width: 75,
                    height: 85,
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
                    width: 75,
                    height: 85,
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
            Container(
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all( 1.0),
                        child: Container(
                          // height: 60,
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
                                    style: TextStyle(fontSize: 16,color: Colors.blue),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,size: 20,color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                              Image.asset('images/カメラ画像.png'),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'NikonD5500',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    const Text(
                                      '¥51,000',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.local_fire_department,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        Text(
                                          '446人が探しています',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style:
                                  ElevatedButton.styleFrom(
                                    primary: const Color.fromRGBO(195, 90, 75, 1),
                                  ),
                                  child: const Text(
                                    '出品する',
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                    fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
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
                              Image.asset('images/カメラ画像.png'),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'NikonD5500',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    const Text(
                                      '¥51,000',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.local_fire_department,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        Text(
                                          '446人が探しています',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style:
                                  ElevatedButton.styleFrom(
                                    primary: const Color.fromRGBO(195, 90, 75, 1),
                                  ),
                                  child: const Text(
                                    '出品する',
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
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
                              Image.asset('images/カメラ画像.png'),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'NikonD5500',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    const Text(
                                      '¥51,000',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.local_fire_department,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        Text(
                                          '446人が探しています',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style:
                                  ElevatedButton.styleFrom(
                                    primary: const Color.fromRGBO(195, 90, 75, 1),
                                  ),
                                  child: const Text(
                                    '出品する',
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
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
          ],
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
