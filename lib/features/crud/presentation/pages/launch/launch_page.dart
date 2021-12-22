import 'package:crud_hive/core/utils/app_colors.dart';
import 'package:crud_hive/features/crud/presentation/widgets/launch/app_name_widget.dart';
import 'package:crud_hive/features/crud/presentation/widgets/launch/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      Modular.to.pushReplacementNamed('/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.blue900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LogoWidget(),
            AppNameWidget(),
          ],
        ),
      ),
    );
  }
}
