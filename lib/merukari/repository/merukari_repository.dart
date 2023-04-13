import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api/merukari_api_client.dart';
import '../model/merukari_item.dart';

final merukariRepositoryProvider =
    Provider<MerukariRepository>((_) => MerukariRepository());

class MerukariRepository {
  MerukariRepository()
      : _api = MerukariApiClient(Dio()..interceptors.add(PrettyDioLogger()));
  final MerukariApiClient _api;

  Future<List<MerukariItem>> fetchMerukariItems() async {
    return _api.fetchMerukariItems();
  }
}
