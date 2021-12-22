import 'package:crud_hive/features/crud/data/datasources/update_task_data_source.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:crud_hive/features/crud/domain/repositories/update_task_repository.dart';

class UpdateTaskRepositoryImpl implements UpdateTaskRepository {
  final UpdateTaskDataSource _updateTaskDataSource;

  UpdateTaskRepositoryImpl(this._updateTaskDataSource);

  @override
  Future<void> update({required int index, required Task task}) async {
    await _updateTaskDataSource.update(index: index, task: task);
  }
}
