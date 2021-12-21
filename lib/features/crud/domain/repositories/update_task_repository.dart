import 'package:crud_hive/features/crud/domain/entities/task.dart';

abstract class UpdateTaskRepository {
  Future<void> update({required int index, required Task task});
}
