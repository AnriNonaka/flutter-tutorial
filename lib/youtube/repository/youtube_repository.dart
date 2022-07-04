import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api/youtube_api_client.dart';
import '../model/youtube_item.dart';

final youtubeRepositoryProvider =
    Provider<YoutubeRepository>((_) => YoutubeRepository());

class YoutubeRepository {
  YoutubeRepository()
      : _api = YoutubeApiClient(Dio()..interceptors.add(PrettyDioLogger()));
  final YoutubeApiClient _api;

  Future<List<YoutubeItem>> fetchYoutubeItems() async {
    return _api.fetchYoutubeItems();
  }
}
