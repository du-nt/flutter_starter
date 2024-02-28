import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    headers: {'Content-Type': 'application/json'}))
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        // Get the token from SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('your_token_key');

        // Add the token to the Authorization header if it exists
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        return handler.next(options);
      },
      onError: (DioException err, ErrorInterceptorHandler handler) {
        print(jsonEncode(err));
        return handler.next(err);
      },
    ),
  );

mixin HttpDelegate {
  Future<dynamic> getRequest(String url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    final apiResponse = await dio.get(url,
        queryParameters: queryParameters,
        options:
            Options(headers: headers ?? {'Content-Type': 'application/json'}));

    return apiResponse.data;
  }

  Future<dynamic> postRequest<T>(String url, T data,
      {Map<String, String>? headers}) async {
    final apiResponse = await dio.post(url,
        data: data,
        options:
            Options(headers: headers ?? {'Content-Type': 'application/json'}));
    return apiResponse.data;
  }
}
