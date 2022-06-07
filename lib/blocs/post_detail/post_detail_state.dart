part of 'post_detail_bloc.dart';

@immutable
abstract class PostDetailState {
  const PostDetailState();

  @override
  List<Object> get props => [];
}

class PostDetailLoadInProgress extends PostDetailState {}

class PostDetailLoadSuccess extends PostDetailState {
  final Post post;

  const PostDetailLoadSuccess({required this.post});

  @override
  List<Object> get props => [post];

  @override
  String toString() {
    return 'PostDetail { post: $post }';
  }
}

class PostDetailLoadFailure extends PostDetailState {}
