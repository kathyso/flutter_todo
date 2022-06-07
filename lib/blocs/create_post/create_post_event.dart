part of 'create_post_bloc.dart';

@immutable
abstract class CreatePostEvent {
  const CreatePostEvent();

  @override
  List<Object?> get props => [];
}

class CreatePostRequested extends CreatePostEvent {
  final String title;
  final String body;

  const CreatePostRequested({required this.title, required this.body});

  @override
  List<Object> get props => [title, body];

  @override
  String toString() {
    return 'CreatePostRequested { title: $title, body: $body }';
  }
}
