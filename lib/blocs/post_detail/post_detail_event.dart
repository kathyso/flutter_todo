part of 'post_detail_bloc.dart';

@immutable
abstract class PostDetailEvent {
  const PostDetailEvent();

  @override
  List<Object?> get props => [];
}

class PostDetailInitialized extends PostDetailEvent {}
