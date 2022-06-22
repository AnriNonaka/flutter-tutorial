import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/residence_api_client.dart';
import '../model/residence_item.dart';


final residenceRepositoryProvider =
Provider<ResidenceRepository>((_) => ResidenceRepository());

class ResidenceRepository {
  final ResidenceApiClient _api = ResidenceApiClient.create() as ResidenceApiClient;

  Future<List<ResidenceItem>> fetchResidenceItems() async {
    return await _api.fetchResidenceItems();
  }
}