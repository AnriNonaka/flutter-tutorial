// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merukari_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MerukariApiClient implements MerukariApiClient {
  _MerukariApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://fir-cli-docker.web.app/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<MerukariItem>> fetchMerukariItems() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(
      _setStreamType<List<MerukariItem>>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(
              _dio.options,
              '/merukari.json',
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    final value = result.data!
        .map((dynamic i) => MerukariItem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
