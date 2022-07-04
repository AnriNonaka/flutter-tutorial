import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '/mvvm/api/qiita_api_client.dart';
import '/mvvm/model/qiita_item.dart';

final qiitaRepositoryProvider =
    Provider<QiitaRepository>((_) => QiitaRepository());

class QiitaRepository {
  QiitaRepository()
      : _api = QiitaApiClient(Dio()..interceptors.add(PrettyDioLogger()));
  final QiitaApiClient _api;

  Future<List<QiitaItem>> fetchQiitaItems(String tag) async {
    return _api.fetchQiitaItems(tag);
  }
}
