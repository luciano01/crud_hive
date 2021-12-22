import 'package:crud_hive/core/utils/app_colors.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final Task task;
  final void Function()? onPressedCompleteTask;
  final void Function()? onTap;
  final void Function()? onPressedDeleteTask;
  final void Function(DismissDirection)? onDismissed;
  const ListItemWidget({
    Key? key,
    required this.task,
    required this.onPressedCompleteTask,
    required this.onPressedDeleteTask,
    required this.onTap,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: task.isCompleted
            ? const Icon(
                Icons.check_circle,
                color: AppColors.blue900,
              )
            : const Icon(
                Icons.check_circle_outline,
                color: AppColors.blue900,
              ),
        onPressed: onPressedCompleteTask,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          task.name!,
          style: TextStyle(
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: AppColors.black,
            fontSize: 18,
          ),
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            task.time ?? 'time',
            style: TextStyle(
              decoration: task.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: AppColors.black,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            task.date ?? 'date',
            style: TextStyle(
              decoration: task.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever_outlined),
        onPressed: onPressedDeleteTask,
      ),
      onTap: onTap,
    );
  }
}
