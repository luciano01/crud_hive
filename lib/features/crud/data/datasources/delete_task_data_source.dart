import 'package:hive/hive.dart';

abstract class DeleteTaskDataSource {
  Future<void> delete({required int index});
}

class DeleteTaskDataSourceImpl implements DeleteTaskDataSource {
  final Box _box;

  DeleteTaskDataSourceImpl(this._box);

  @override
  Future<void> delete({required int index}) async {
    await _box.delete(index);
  }
}
