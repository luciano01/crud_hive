import 'package:crud_hive/core/utils/app_images.dart';
import 'package:crud_hive/core/utils/app_texts.dart';
import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.empty,
            width: 200,
          ),
          const Text(
            AppTexts.emptyListTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const Text(
            AppTexts.emptyListSubtitle,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
