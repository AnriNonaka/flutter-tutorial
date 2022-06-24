import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api/residence_api_client.dart';
import '../model/residence_item.dart';

final residenceRepositoryProvider =
    Provider<ResidenceRepository>((_) => ResidenceRepository());

class ResidenceRepository {
  ResidenceRepository()
      : _api = ResidenceApiClient(Dio()..interceptors.add(PrettyDioLogger()));
  final ResidenceApiClient _api;

  Future<List<ResidenceItem>> fetchResidenceItems() async {
    return _api.fetchResidenceItems();
  }
}
