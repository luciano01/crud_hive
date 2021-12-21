import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:crud_hive/features/crud/domain/repositories/create_task_repository.dart';

class CreateTask implements CreateTaskRepository {
  final CreateTaskRepository _repository;

  CreateTask(this._repository);

  @override
  Future<void> create({required Task task}) async {
    return await _repository.create(task: task);
  }
}
