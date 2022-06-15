import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({Key? key}) : super(key: key);

  @override
  State<AsyncScreen> createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  //_formKeyを使うために書く
  final _formKey = GlobalKey<FormState>();

  //このclassで使い回すやつ
  String _name = '';
  String _age = '';
  String _birthday = '';

  @override
  //Widgetツリーの初期化を行う。
  void initState() {
    super.initState();
    _checkData();
  }

  // ⑤アプリ起動時に保存したデータを読み込む
  void _checkData() async {
    // SharedPreferencesオブジェクトの取得
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // 端末に保存されている情報を取得する。なければ'未設定'とする。
      _name = prefs.getString('name') ?? '未設定';
      _age = prefs.getString('age') ?? '未設定';
      _birthday = prefs.getString('birthday') ?? '未設定';
    });
  }

  // ④「保存」押した時に端末に情報を保存する
  void _setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('name', _name);
      prefs.setString('age', _age);
      prefs.setString('birthday', _birthday);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildInformationSection(context)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInputDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _showInputDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '登録',
          ),
          content: SizedBox(
            // 複数のFormFiled Widgetをグループ化して管理するためのコンテナWidgetです。
            // グループ化することで、ユーザが入力データの送信ボタンを押した時に、
            // フォーム内の各入力データの形式チェックするValidatorを一括して呼び出すことが出来る
            // TextFormFieldなどの最上位のコンテナとして定義します
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //①ここで文字を入力してvalueに情報が入る
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "名前", labelText: '名前'),
                    //validator:違ったら赤くエラーで出るやつ
                    //value:入力した情報が入るやつ
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    },
                    //②valueの情報が変わった事をキャッチして「_name」に入れる
                    onChanged: (value) {
                      _name = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '年齢',
                      labelText: '年齢',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _age = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '誕生日',
                      labelText: '誕生日',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _birthday = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text('保存'),
              //③_setDataに渡す
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  _setData();
                }
              },
            ),
          ],
        );
      },
    );
  }

  //③画面にchageされたvalueの情報が表示される
  Widget _buildInformationSection(context) {
    return Column(
      children: [
        Text('名前 $_name'),
        Text('誕生日 $_age'),
        Text('年齢 $_birthday'),
      ],
    );
  }
}
