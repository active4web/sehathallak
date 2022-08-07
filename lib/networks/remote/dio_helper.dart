import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/shared/constants.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {String url, Map<String, dynamic> query, Map<String, dynamic> header}) {
    return dio.get(
      url,
      options: Options(headers: header ?? null),
      queryParameters: query ?? null,
    );
  }

  static Future<Response> postData(
      {String url, dynamic data, Map<String, dynamic> header}) async {
    return await dio.post(
      url,
      options: Options(headers: header ?? null),
      data: data ?? null,
    );
  }
}
