import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'todo_db.g.dart';

// Driftを使ってデータベースを構築

// テーブルの作成
class Todos extends Table {
  // 主キー（autoIncrementで自動的にIDを設置する）
  IntColumn get id => integer().autoIncrement()();
  // タイトル（デフォルト値と長さを指定する）
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get description => text().withLength(min: 1, max: 50)();
  DateTimeColumn get addDate => dateTime()();
  DateTimeColumn get limitDate => dateTime()();
}

// データベースの場所を指定
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

// データベースの実行
@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // 全てのデータの取得
  Future<List<Todo>> get readAllTodoData => select(todos).get();

  // データの追加,DBに保存がされる
  Future writeTodo(TodosCompanion todo) => into(todos).insert(todo);

  // データの削除
  Future deleteTodo(int id) =>
      (delete(todos)..where((tbl) => tbl.id.equals(id))).go();
}