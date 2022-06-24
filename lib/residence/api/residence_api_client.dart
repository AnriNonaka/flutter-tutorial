import 'package:dio/dio.dart';
import 'package:flutter_tutorial/residence/model/residence_item.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'residence_api_client.g.dart';


@RestApi(baseUrl: 'https://fir-cli-docker.web.app/api/v1/')
abstract class ResidenceApiClient {
  factory ResidenceApiClient(Dio dio, {String baseUrl}) = _ResidenceApiClient;

  //「create」のエラー：解決するためには大幅に変更が必要なためこのままで。
  static ResidenceApiClient get create {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ResidenceApiClient(dio);
  }

  @GET('/residence.json')
  Future<List<ResidenceItem>> fetchResidenceItems();
}
