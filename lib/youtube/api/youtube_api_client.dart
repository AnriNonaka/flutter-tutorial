import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import '../model/youtube_item.dart';

part 'youtube_api_client.g.dart';

@RestApi(baseUrl: 'https://fir-cli-docker.web.app/api/v1/')
abstract class YoutubeApiClient {
  factory YoutubeApiClient(Dio dio, {String baseUrl}) = _YoutubeApiClient;

  //「create」のエラー：解決するためには大幅に変更が必要なためこのままで。
  static YoutubeApiClient get create {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return YoutubeApiClient(dio);
  }

  @GET('/youtube.json')
  Future<List<YoutubeItem>> fetchYoutubeItems();
}
