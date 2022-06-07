import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_todo/network/http_method.dart';

class ApiManager {
  ApiManager._();

  factory ApiManager() {
    return _instance;
  }

  static final ApiManager _instance = ApiManager._();
  static const maxRetry = 3;

  Future<dynamic> request(
    HttpMethod method,
    String url, {
    dynamic data,
    String contentType = Headers.jsonContentType,
    Map<String, dynamic>? customHeaders,
    int retryCount = 0,
  }) async {
    try {
      Dio dio = Dio();
      dio.interceptors
          .add(QueuedInterceptorsWrapper(onRequest: (options, handler) async {
        options.method = method.name;
        options.contentType = contentType;

        if (customHeaders != null) {
          options.headers.addAll(customHeaders);
        }
        return handler.next(options);
      }, onResponse: (response, handler) async {
        debugPrint("Got response: ${response.toString()}");

        return handler.next(response);
      }));

      final result = await dio.request(url, data: data);
      return result;
    } on DioError catch (e) {
      debugPrint("DioError: message:${e.message}, url: $url");
      debugPrint("DioError: ${e.response?.statusMessage}");
      debugPrint("DioError: ${e.response?.toString()}");

      if (e.response == null) {
        debugPrint("Connection failed.");
      }

      if (retryCount > maxRetry) {
        throw Exception();
      }

      return await request(method, url,
          data: data, contentType: contentType, retryCount: ++retryCount);
    } catch (_) {
      rethrow;
    }
  }
}
