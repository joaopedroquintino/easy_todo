import 'package:easy_todo/app/dependencies/local_storage/local_storage.dart';
import 'package:easy_todo/app/features/tasks/domain/entities/task_entity.dart';
import 'package:meta/meta.dart';

const tasksKey = 'TASKS';

class TaskDatasource {
  TaskDatasource({@required LocalStorage storage}) : _storage = storage;

  final LocalStorage _storage;

  Future<List<TaskEntity>> getTasks() async {
    final response = await _storage.get(tasksKey);

    final List<Map<String, dynamic>> jsonList = response['data'];

    return jsonList.map((json) => TaskEntity.fromJson(json)).toList();
  }

  Future<bool> postTask(TaskEntity task) async {
    return _storage.post(json: task.toJson(), key: tasksKey);
  }

  Future<bool> updateTask(TaskEntity task) async {
    return _storage.update(json: task.toJson(), key: tasksKey, id: task.id);
  }
}
