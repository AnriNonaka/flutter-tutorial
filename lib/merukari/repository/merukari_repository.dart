import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/merukari_api_client.dart';
import '../model/merukari_item.dart';

final merukariRepositoryProvider =
    Provider<MerukariRepository>((_) => MerukariRepository());

class MerukariRepository {
  final MerukariApiClient _api = MerukariApiClient.create;

  Future<List<MerukariItem>> fetchMerukariItems() async {
    return _api.fetchMerukariItems();
  }
}
