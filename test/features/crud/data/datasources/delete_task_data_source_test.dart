import 'package:crud_hive/features/crud/data/datasources/delete_task_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_task_data_source_test.mocks.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  late DeleteTaskDataSourceImpl deleteTaskDataSourceImpl;
  late MockHiveInterface mockHiveInterface;
  late MockBox mockBox;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    mockBox = MockBox();
    deleteTaskDataSourceImpl = DeleteTaskDataSourceImpl(mockBox);
  });

  var _tIndex = 1;

  test('Should delete a Task from the DataSource.', () async {
    // arrange
    when(mockHiveInterface.openBox('tasks')).thenAnswer((_) async => mockBox);
    when(mockBox.delete(_tIndex)).thenAnswer((_) async => 0);
    // act
    await deleteTaskDataSourceImpl.delete(index: _tIndex);
    // assert
    verify(mockBox.delete(_tIndex));
  });
}
