import 'package:dio/dio.dart';

import 'Constants.dart';

class DioHelper {
  static Dio dio = Dio();

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "",
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json",
          "lang": "en",
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? authorization,
  }) async {
    //? for option headers  is = old header+ optional header
    // dio.options.headers = {"Authorization": auth!, "lang": lang!};
    return await dio.get(api + url,
        queryParameters: query,
        options: Options(headers: {
          "Authorization": authorization ?? "",
          "lang": lang ?? "ar",
        }));
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? lang,
    String? authorization,
  }) async {
    //? for option headers  is = old header+ optional header
    dio.options.headers = {
      "Authorization": authorization ?? "",
      "lang": lang ?? "ar",
    };
    return await dio.post(
      api + url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? lang,
    String? authorization,
  }) async {
    //? for option headers  is = old header+ optional header
    dio.options.headers = {
      "Authorization": authorization ?? "",
      "lang": lang ?? "ar",
    };
    return await dio.put(
      api + url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response>? deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? lang,
    String? authorization,
  }) async {
    dio.options.headers = {
      "Authorization": authorization ?? "",
      "lang": lang ?? "ar",
    };
    return await dio.delete(
      api + url,
      data: data,
      queryParameters: query,
      // options: Options(headers:{} )
    );
  }
}
