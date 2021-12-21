import 'package:crud_hive/features/crud/data/datasources/update_task_data_source.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_task_data_source_test.mocks.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  late UpdateTaskDataSourceImpl updateTaskDataSourceImpl;
  late MockHiveInterface mockHiveInterface;
  late MockBox mockBox;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    mockBox = MockBox();
    updateTaskDataSourceImpl = UpdateTaskDataSourceImpl(mockBox);
  });

  var _tIndex = 1;
  var _tTask = Task(
    name: 'name',
    isCompleted: false,
    date: 'date',
    time: 'time',
  );

  test('Should update a Task from the DataSource.', () async {
    // arrange
    when(mockHiveInterface.openBox('tasks')).thenAnswer((_) async => mockBox);
    when(mockBox.putAt(_tIndex, _tTask)).thenAnswer((_) async => 0);
    // act
    await updateTaskDataSourceImpl.update(index: _tIndex, task: _tTask);
    // assert
    verify(mockBox.putAt(_tIndex, _tTask));
  });
}
