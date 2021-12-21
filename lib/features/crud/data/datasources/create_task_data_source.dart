import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:hive/hive.dart';

abstract class CreateTaskDataSource {
  Future<void> create({required Task task});
}

class CreateTaskDataSourceImpl implements CreateTaskDataSource {
  final Box _box;

  CreateTaskDataSourceImpl(this._box);

  @override
  Future<void> create({required Task task}) async {
    await _box.add(task);
  }
}
