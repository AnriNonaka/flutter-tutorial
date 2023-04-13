import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/merukari_item.dart';

part 'merukari_api_client.g.dart';

@RestApi(baseUrl: 'https://fir-cli-docker.web.app/api/v1/')
abstract class MerukariApiClient {
  factory MerukariApiClient(Dio dio, {String baseUrl}) = _MerukariApiClient;

  @GET('/merukari.json')
  Future<List<MerukariItem>> fetchMerukariItems();
}
