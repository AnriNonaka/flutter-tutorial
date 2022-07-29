import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'food_list_db.g.dart';

// シングルトン対応にしている(Repositoryページにも変更あり)

// テーブルの作成
class Foods extends Table {
  // 主キー（autoIncrementで自動的にIDを設置する）
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 50)();

  TextColumn get tag1 => text()();

  TextColumn get tag2 => text()();

  TextColumn get tag3 => text()();

  TextColumn get tag4 => text()();

  TextColumn get tag5 => text()();
}

// データベースの場所を指定
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db2.sqlite'));
    //シングルトン対応すべく、以下1行追加
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    return NativeDatabase(file);
  });
}

// データベースへアクセス（実際に読み書き）するクラスの定義
// 中のメソッドは外向けに公開するメソッドとその動きを定義している。
@DriftDatabase(tables: [Foods])
class MyDatabase extends _$MyDatabase {
  static MyDatabase? _instance;

  static MyDatabase getInstance() {
    //シングルトン対応
    if (_instance == null) {
      _instance = new MyDatabase();
    }
    return _instance!;
  }

  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // 全てのデータの取得
  Future<List<Food>> get readAllFoodData => select(foods).get();

  // データの追加,DBに保存がされる
  Future writeFood(FoodsCompanion food) => into(foods).insert(food);

  // データの更新
  Future updateFood(FoodsCompanion food) => update(foods).replace(food);

  // データの削除
  Future deleteFood(int id) =>
      (delete(foods)..where((tbl) => tbl.id.equals(id))).go();
}
