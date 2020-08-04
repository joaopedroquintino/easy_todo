import 'package:meta/meta.dart';

class TaskEntity {
  final String body;
  final bool isDone;
  final String id;

  TaskEntity({
    @required this.body,
    this.isDone = false,
    @required this.id,
  });

  TaskEntity copyWithToggle() {
    return TaskEntity(
      body: body,
      id: id,
      isDone: !isDone,
    );
  }

  factory TaskEntity.fromJson(Map<String, dynamic> json) {
    return TaskEntity(
      body: json['body'],
      isDone: json['isDone'],
      id: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'body': body,
      'isDone': isDone,
      'id': id,
    };
  }
}
