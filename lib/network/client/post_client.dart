import 'dart:convert';

import 'package:flutter_todo/models/post.dart';
import 'package:flutter_todo/network/api_manager.dart';
import 'package:flutter_todo/network/http_method.dart';
import 'package:flutter_todo/utils/network_constants.dart';

class PostClient {
  static String get _baseUrl {
    return NetworkConstants.baseUrl;
  }

  static ApiManager get _api {
    return ApiManager();
  }

  Future<List<Post>> fetchPosts({required int userId}) async {
    final url = '$_baseUrl/posts?userId=$userId';

    try {
      final response = await _api.request(HttpMethod.get, url);
      final posts = (response.data as List).map((data) {
        return Post.fromJson(data);
      }).toList();
      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
