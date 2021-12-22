import 'package:crud_hive/features/crud/data/datasources/create_task_data_source.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:crud_hive/features/crud/domain/repositories/create_task_repository.dart';

class CreateTaskRepositoryImpl implements CreateTaskRepository {
  final CreateTaskDataSource _createTaskDataSource;

  CreateTaskRepositoryImpl(this._createTaskDataSource);

  @override
  Future<void> create({required Task task}) async {
    await _createTaskDataSource.create(task: task);
  }
}
