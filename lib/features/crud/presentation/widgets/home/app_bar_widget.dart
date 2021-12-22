import 'package:crud_hive/core/utils/app_colors.dart';
import 'package:crud_hive/core/utils/app_texts.dart';
import 'package:crud_hive/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: const Text(
        AppTexts.homeTitle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      elevation: 0,
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Text(
                  DateFormatter().dateTimeNowFormatted(),
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.today,
                  color: AppColors.blue900,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
