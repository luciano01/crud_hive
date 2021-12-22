import 'package:crud_hive/features/crud/data/datasources/create_task_data_source.dart';
import 'package:crud_hive/features/crud/data/datasources/delete_task_data_source.dart';
import 'package:crud_hive/features/crud/data/datasources/update_task_data_source.dart';
import 'package:crud_hive/features/crud/data/repositories/create_task_repository_impl.dart';
import 'package:crud_hive/features/crud/data/repositories/delete_task_repository_impl.dart';
import 'package:crud_hive/features/crud/data/repositories/update_task_repository_impl.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:crud_hive/features/crud/domain/repositories/create_task_repository.dart';
import 'package:crud_hive/features/crud/domain/repositories/delete_task_repository.dart';
import 'package:crud_hive/features/crud/domain/repositories/update_task_repository.dart';
import 'package:crud_hive/features/crud/domain/usecases/create_task.dart';
import 'package:crud_hive/features/crud/domain/usecases/delete_task.dart';
import 'package:crud_hive/features/crud/domain/usecases/update_task.dart';
import 'package:crud_hive/features/crud/presentation/mobx/home/home_store.dart';
import 'package:crud_hive/features/crud/presentation/mobx/register/register_store.dart';
import 'package:crud_hive/features/crud/presentation/pages/home/home_page.dart';
import 'package:crud_hive/features/crud/presentation/pages/launch/launch_page.dart';
import 'package:crud_hive/features/crud/presentation/pages/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Local
        Bind<Box>((i) => Hive.box<Task>('tasks')),

        // DataSource
        Bind((i) => CreateTaskDataSourceImpl(i.get<Box>())),
        Bind((i) => UpdateTaskDataSourceImpl(i.get<Box>())),
        Bind((i) => DeleteTaskDataSourceImpl(i.get<Box>())),

        // Repository
        Bind((i) => CreateTaskRepositoryImpl(i.get<CreateTaskDataSource>())),
        Bind((i) => UpdateTaskRepositoryImpl(i.get<UpdateTaskDataSource>())),
        Bind((i) => DeleteTaskRepositoryImpl(i.get<DeleteTaskDataSource>())),

        // Use cases
        Bind((i) => CreateTask(i.get<CreateTaskRepository>())),
        Bind((i) => UpdateTask(i.get<UpdateTaskRepository>())),
        Bind((i) => DeleteTask(i.get<DeleteTaskRepository>())),

        // Store
        Bind(
          (i) => HomeStore(
            i.get<UpdateTask>(),
            i.get<DeleteTask>(),
          ),
        ),
        Bind(
          (i) => RegisterStore(
            i.get<CreateTask>(),
            i.get<UpdateTask>(),
            i.get<DeleteTask>(),
          ),
        ),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const LaunchPage(),
      transition: TransitionType.rightToLeft,
    ),
    ChildRoute(
      '/home',
      child: (context, args) => const HomePage(),
      transition: TransitionType.rightToLeft,
    ),
    ChildRoute(
      '/register',
      child: (context, args) => RegisterPage(
        task: args.data,
      ),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
