import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import '../model/qiita_item.dart';

part 'qiita_api_client.g.dart';

@RestApi(baseUrl: 'https://qiita.com/api/v2/')
abstract class QiitaApiClient {
  factory QiitaApiClient(Dio dio, {String baseUrl}) = _QiitaApiClient;

  static Future<QiitaApiClient> create() async {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return QiitaApiClient(dio);
  }

  @GET('/tags/{tag}/items')
  Future<List<QiitaItem>> fetchQiitaItems(@Path('tag') String tag);
}
