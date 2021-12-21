import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:hive/hive.dart';

abstract class UpdateTaskDataSource {
  Future<void> update({required int index, required Task task});
}

class UpdateTaskDataSourceImpl implements UpdateTaskDataSource {
  final Box _box;

  UpdateTaskDataSourceImpl(this._box);

  @override
  Future<void> update({required int index, required Task task}) async {
    await _box.putAt(index, task);
  }
}
