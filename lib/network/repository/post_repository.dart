import 'package:flutter_todo/models/post.dart';
import 'package:flutter_todo/network/client/post_client.dart';

class PostRepository {
  final PostClient _client;

  static final PostRepository _instance = PostRepository._(PostClient());

  factory PostRepository() {
    return _instance;
  }

  PostRepository._(this._client);

  Future<List<Post>> fetchPosts({required int userId}) async {
    try {
      final result = await _client.fetchPosts(userId: userId);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Post> fetchPostDetail({required int postId}) async {
    try {
      final result = await _client.fetchPostDetail(postId: postId);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Post> createPost(
      {required int userId,
      required String title,
      required String body}) async {
    try {
      final post = Post(userId: userId, title: title, body: body);
      final data = post.toJson();
      final result = await _client.createPost(data: data);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }
}
