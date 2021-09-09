import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "baseUrl",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({String url, Map<String, dynamic> query}) {
    return dio.get(
      url,
      queryParameters: query ?? null,
    );
  }

  static Future<Response> postData({
    String url,
    Map<String, dynamic> query,
    dynamic data,
  }) async {
    return await dio.post(
      url,
      queryParameters: query ?? null,
      data: data ?? null,
    );
  }
}
