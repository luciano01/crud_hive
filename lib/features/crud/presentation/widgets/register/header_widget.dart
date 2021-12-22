import 'package:crud_hive/core/utils/app_colors.dart';
import 'package:crud_hive/core/utils/app_texts.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final Task? task;
  final int? index;
  const HeaderWidget({
    Key? key,
    required this.task,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 56,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index == null ? AppTexts.createTitle : AppTexts.updateTitle,
            style: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            index == null ? AppTexts.createMessage : AppTexts.updateMessage,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.grey600,
            ),
          ),
        ],
      ),
    );
  }
}
