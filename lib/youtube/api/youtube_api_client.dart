import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/youtube_item.dart';

part 'youtube_api_client.g.dart';

@RestApi(baseUrl: 'https://fir-cli-docker.web.app/api/v1/')
abstract class YoutubeApiClient {
  factory YoutubeApiClient(Dio dio, {String baseUrl}) = _YoutubeApiClient;

  @GET('/youtube.json')
  Future<List<YoutubeItem>> fetchYoutubeItems();
}
