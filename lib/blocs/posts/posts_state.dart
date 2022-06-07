part of 'posts_bloc.dart';

@immutable
abstract class PostsState {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsLoadInProgress extends PostsState {}

class PostsLoadSuccess extends PostsState {
  final List<Post> posts;

  const PostsLoadSuccess({required this.posts});

  @override
  List<Object> get props => [posts];

  @override
  String toString() {
    return 'PostsLoadSuccess { posts: $posts }';
  }
}

class PostsLoadFailure extends PostsState {}
