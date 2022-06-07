import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class Todo {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "userId")
  final int userId;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "completed")
  final bool completed;

  Todo({
    this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}