import 'package:bloc/bloc.dart';
import 'package:flutter_todo/models/post.dart';
import 'package:flutter_todo/network/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final int postId;
  final PostRepository _postRepository = PostRepository();

  PostDetailBloc({required this.postId}) : super(PostDetailLoadInProgress()) {
    on<PostDetailInitialized>(_onPostDetailInitialized);

    add(PostDetailInitialized());
  }

  void _onPostDetailInitialized(
      PostDetailInitialized event, Emitter<PostDetailState> emit) async {
    try {
      // fetch all posts of userId
      final post = await _postRepository.fetchPostDetail(postId: postId);
      emit(PostDetailLoadSuccess(post: post));
    } catch (e) {
      emit(PostDetailLoadFailure());
    }
  }
}
