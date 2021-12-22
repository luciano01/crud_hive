// Mocks generated by Mockito 5.0.17 from annotations
// in crud_hive/test/features/crud/data/repositories/update_task_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:crud_hive/features/crud/data/datasources/update_task_data_source.dart'
    as _i2;
import 'package:crud_hive/features/crud/domain/entities/task.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [UpdateTaskDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateTaskDataSource extends _i1.Mock
    implements _i2.UpdateTaskDataSource {
  MockUpdateTaskDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> update({int? index, _i4.Task? task}) => (super.noSuchMethod(
      Invocation.method(#update, [], {#index: index, #task: task}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}
