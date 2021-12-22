import 'package:crud_hive/core/utils/app_colors.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:crud_hive/features/crud/presentation/mobx/home/home_store.dart';
import 'package:crud_hive/features/crud/presentation/pages/register/register_page.dart';
import 'package:crud_hive/features/crud/presentation/widgets/home/app_bar_widget.dart';
import 'package:crud_hive/features/crud/presentation/widgets/home/empty_list_widget.dart';
import 'package:crud_hive/features/crud/presentation/widgets/home/fab_widget.dart';
import 'package:crud_hive/features/crud/presentation/widgets/home/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PreferredSize(
        child: AppBarWidget(),
        preferredSize: Size.fromHeight(56),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FabWidget(
        isMini: true,
        iconData: Icons.add,
        onPressed: () {
          Modular.to.pushNamed('/register');
        },
      ),
      body: ValueListenableBuilder<Box<Task>>(
        valueListenable: Hive.box<Task>('tasks').listenable(),
        builder: (context, box, _) {
          if (box.isEmpty) return const EmptyListWidget();
          return _buildList(
            box: box,
            store: store,
          );
        },
      ),
    );
  }
}

Widget _buildList({
  required Box<Task> box,
  required HomeStore store,
}) {
  return ListView.builder(
    itemCount: box.length,
    itemBuilder: (context, index) {
      Task _task = box.getAt(index) as Task;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Card(
          child: ListItemWidget(
            task: _task,
            onPressedCompleteTask: () {
              Task newTask = _task.copyWith(isCompleted: !_task.isCompleted);
              store.update(index: index, task: newTask);
            },
            onDismissed: (_) {
              store.delete(index: index);
            },
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegisterPage(
                    index: index,
                    task: _task,
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
