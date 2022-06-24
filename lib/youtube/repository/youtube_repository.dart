import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/youtube_api_client.dart';
import '../model/youtube_item.dart';

final youtubeRepositoryProvider =
Provider<YoutubeRepository>((_) => YoutubeRepository());

class YoutubeRepository {
   final YoutubeApiClient _api = YoutubeApiClient.create;

  Future <List<YoutubeItem>> fetchYoutubeItems() async {
    return  _api.fetchYoutubeItems();
  }
}
