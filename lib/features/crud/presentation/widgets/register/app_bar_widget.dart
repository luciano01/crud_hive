import 'package:crud_hive/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final int? index;
  const AppBarWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: index == null ? AppColors.white : AppColors.blueDark900,
      iconTheme: IconThemeData(
        color: index == null ? AppColors.black : AppColors.white,
      ),
      elevation: 0,
    );
  }
}
