import 'dart:ui';
import 'package:crud_hive/core/utils/app_colors.dart';
import 'package:crud_hive/core/utils/app_texts.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final Task task;
  final void Function()? onPressedCompleteTask;
  final void Function()? onTap;
  final void Function(DismissDirection)? onDismissed;
  const ListItemWidget({
    Key? key,
    required this.task,
    required this.onPressedCompleteTask,
    required this.onTap,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: onDismissed,
      direction: DismissDirection.startToEnd,
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: const [
                  Text(
                    AppTexts.deleteTitle,
                    style: TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                  Icon(
                    Icons.delete_forever,
                    color: AppColors.red500,
                  ),
                ],
              ),
              content: const Text(
                AppTexts.deleteMessage,
                style: TextStyle(
                  color: AppColors.black,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    AppTexts.deleteButton.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    AppTexts.cancelButton.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      background: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.red500,
        ),
        child: Row(
          children: const [
            Icon(
              Icons.delete_forever_outlined,
              color: AppColors.white,
            ),
            Text(
              AppTexts.dismissibleDelete,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      child: ListTile(
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
        onTap: onTap,
      ),
    );
  }
}
