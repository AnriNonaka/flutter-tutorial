import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'merukari_client_state_notifier.dart';
import 'model/merukari_item.dart';

class GoodsInfo {

  GoodsInfo({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.compassion,
  });
  final String imagePath;
  final String title;
  final String price;
  final String compassion;
}

class MerukariScreen extends ConsumerWidget {
  const MerukariScreen({super.key});

  static const lightGray = Color.fromRGBO(231, 231, 231, 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(merukariClientStateNotifier);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context, state.merukariItems),
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
                  padding: EdgeInsets.only(top: 5),
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
            '出品',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<MerukariItem> merukariItems) {
    //ここに定数を作って、各Containerのwidthで使う。
    final bottomWidths = (MediaQuery.of(context).size.width - 60) / 4;
    //ListViewBuilder入れて出たエラー、下記2行で解決
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: ColoredBox(
          color: const Color.fromRGBO(239, 239, 239, 1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset('images/メルカリ_トップ画.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
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
                                  padding: EdgeInsets.only(top: 4),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
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
                                  padding: EdgeInsets.only(top: 4),
                                  child: Icon(
                                    Icons.photo_library_outlined,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
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
                                  padding: EdgeInsets.only(top: 4),
                                  child: Icon(
                                    Icons.qr_code,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 2),
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
                                  padding: EdgeInsets.only(top: 4),
                                  child: Icon(
                                    Icons.description_outlined,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
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
              ColoredBox(
                color: Colors.white,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: lightGray),
                              ),
                            ),
                            child: ListTile(
                              title: const Text(
                                '売れやすい持ち物',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
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
                                        fontSize: 16,
                                        color: Colors.blue,
                                      ),
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
                            itemCount: merukariItems.length,
                            itemBuilder: (BuildContext context, index) {
                              final currentGoodsData = merukariItems[index];
                              return Container(
                                height: 80,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: lightGray),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Image.network(
                                          currentGoodsData.imagePath ?? '',),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              currentGoodsData.title ?? '',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              currentGoodsData.price ?? '',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.local_fire_department,
                                                  color: Colors.blue,
                                                  size: 20,
                                                ),
                                                Text(
                                                  currentGoodsData.compassion ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color.fromRGBO(
                                              195,
                                              90,
                                              75,
                                              1,
                                            ),
                                          ),
                                          child: const Text(
                                            '出品する',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
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
