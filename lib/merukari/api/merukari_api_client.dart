import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import '../model/merukari_item.dart';

part 'merukari_api_client.g.dart';

@RestApi(baseUrl: 'https://fir-cli-docker.web.app/api/v1/')
abstract class MerukariApiClient {
  factory MerukariApiClient(Dio dio, {String baseUrl}) = _MerukariApiClient;

  //「create」のエラー：解決するためには大幅に変更が必要なためこのままで。
  static MerukariApiClient get create {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return MerukariApiClient(dio);
  }

  @GET('/merukari.json')
  Future<List<MerukariItem>> fetchMerukariItems();
}
