import 'package:dio/dio.dart';
import 'package:flutter_tutorial/residence/model/residence_item.dart';
import 'package:retrofit/http.dart';

part 'residence_api_client.g.dart';

@RestApi(baseUrl: 'https://fir-cli-docker.web.app/api/v1/')
abstract class ResidenceApiClient {
  factory ResidenceApiClient(Dio dio, {String baseUrl}) = _ResidenceApiClient;

  @GET('/residence.json')
  Future<List<ResidenceItem>> fetchResidenceItems();
}
