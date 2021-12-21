import 'package:crud_hive/features/crud/domain/entities/task.dart';

abstract class CreateTaskRepository {
  Future<void> create({required Task task});
}
