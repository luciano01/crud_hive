import 'package:crud_hive/features/crud/data/datasources/delete_task_data_source.dart';
import 'package:crud_hive/features/crud/domain/repositories/delete_task_repository.dart';

class DeleteTaskRepositoryImpl implements DeleteTaskRepository {
  final DeleteTaskDataSource _deleteTaskDataSource;

  DeleteTaskRepositoryImpl(this._deleteTaskDataSource);

  @override
  Future<void> delete({required int index}) async {
    await _deleteTaskDataSource.delete(index: index);
  }
}
