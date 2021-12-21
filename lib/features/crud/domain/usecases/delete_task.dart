import 'package:crud_hive/features/crud/domain/repositories/delete_task_repository.dart';

class DeleteTask implements DeleteTaskRepository {
  final DeleteTaskRepository _repository;

  DeleteTask(this._repository);

  @override
  Future<void> delete({required int index}) async {
    return await _repository.delete(index: index);
  }
}
