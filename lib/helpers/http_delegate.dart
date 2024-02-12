import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    headers: {'Content-Type': 'application/json'}));

mixin HttpDelegate {
  dynamic _apiCallProcessing(Function process) {
    try {
      return process();
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.message);
      }
    }
  }

  Future<dynamic> getRequest(
    String apiUrl, {
    Map<String, dynamic>? headers,
  }) async {
    return _apiCallProcessing(() async {
      final apiResponse = await dio.get(apiUrl,
          options: Options(
              headers: headers ?? {'Content-Type': 'application/json'}));
      return apiResponse.data;
    });
  }

  Future<dynamic> postRequest(String apiUrl, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    return _apiCallProcessing(() async {
      final apiResponse = await dio.post(apiUrl,
          data: data,
          options: Options(
              headers: headers ?? {'Content-Type': 'application/json'}));
      return apiResponse.data;
    });
  }
}
