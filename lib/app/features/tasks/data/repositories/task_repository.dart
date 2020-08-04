import 'package:easy_todo/app/features/tasks/data/datasources/task_datasource.dart';
import 'package:easy_todo/app/features/tasks/domain/entities/task_entity.dart';
import 'package:meta/meta.dart';

class TaskRepository {
  TaskRepository({@required TaskDatasource taskDatasource})
      : _datasource = taskDatasource;

  final TaskDatasource _datasource;

  Future<List<TaskEntity>> getTasks() async {
    return _datasource.getTasks();
  }

  Future<bool> postTask(TaskEntity task) async {
    return _datasource.postTask(task);
  }
}
