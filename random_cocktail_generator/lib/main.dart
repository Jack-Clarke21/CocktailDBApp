import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/Widgets/AppColors.dart';
import 'package:random_cocktail_generator/router.dart';


void main() {
  AppRouter.setupRouter();
  runApp(MyAPP());
}
class MyAPP extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.router.generator,
      title: 'Fluro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor:AppColors.getColor(AppColor.buttonTextColor),
              backgroundColor: AppColors.getColor(AppColor.primaryColor),
              disabledForegroundColor:AppColors.getColor(AppColor.secondaryColor),
              shadowColor: AppColors.getColor(AppColor.shadowColor),
              minimumSize: const Size(180, 40),
              //elevation: 102.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
    );
  }
}