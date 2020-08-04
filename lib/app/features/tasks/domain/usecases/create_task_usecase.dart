import 'package:easy_todo/app/core/usecase.dart';
import 'package:easy_todo/app/features/tasks/domain/entities/task_entity.dart';

class CreateTaskUsecase implements Usecase<TaskEntity, Future<bool>>{
  @override
  Future<bool> call(void) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
