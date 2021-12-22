import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:crud_hive/features/crud/domain/usecases/delete_task.dart';
import 'package:crud_hive/features/crud/domain/usecases/update_task.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final UpdateTask _updateUseCase;
  final DeleteTask _deleteUseCase;

  _HomeStoreBase(
    this._updateUseCase,
    this._deleteUseCase,
  );

  Future<void> update({required int index, required Task task}) async {
    return _updateUseCase.update(index: index, task: task);
  }

  Future<void> delete({required int index}) async {
    return _deleteUseCase.delete(index: index);
  }
}
