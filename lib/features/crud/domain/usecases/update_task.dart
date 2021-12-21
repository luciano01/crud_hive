import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:crud_hive/features/crud/domain/repositories/update_task_repository.dart';

class UpdateTask implements UpdateTaskRepository {
  final UpdateTaskRepository _repository;

  UpdateTask(this._repository);

  @override
  Future<void> update({required int index, required Task task}) async {
    return await _repository.update(index: index, task: task);
  }
}
