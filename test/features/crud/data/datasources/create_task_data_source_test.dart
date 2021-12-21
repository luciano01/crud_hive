import 'package:crud_hive/features/crud/data/datasources/create_task_data_source.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_task_data_source_test.mocks.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  late CreateTaskDataSourceImpl createTaskDataSourceImpl;
  late MockHiveInterface mockHiveInterface;
  late MockBox mockBox;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    mockBox = MockBox();
    createTaskDataSourceImpl = CreateTaskDataSourceImpl(mockBox);
  });

  var _tTask = Task(
    name: 'name',
    isCompleted: false,
    date: 'date',
    time: 'time',
  );

  test('Should create a Task from the DataSource.', () async {
    // arrange
    when(mockHiveInterface.openBox('tasks')).thenAnswer((_) async => mockBox);
    when(mockBox.add(_tTask)).thenAnswer((_) async => 0);
    // act
    await createTaskDataSourceImpl.create(task: _tTask);
    // assert
    verify(mockBox.add(_tTask));
  });
}
