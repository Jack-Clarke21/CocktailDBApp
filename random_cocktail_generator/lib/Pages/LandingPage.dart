import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/Widgets/Buttons.dart';
import 'package:random_cocktail_generator/Widgets/animation.dart';
import '../Widgets/AppColors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage ({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.getColor(AppColor.buttonTextColor), 
            backgroundColor: AppColors.getColor(AppColor.primaryColor),
            disabledForegroundColor: AppColors.getColor(AppColor.secondaryColor),
            padding: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 102.0,
            shadowColor: AppColors.getColor(AppColor.shadowColor) 
          )
        )
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: AnimatedTextSwitcher(),
              ),
              Center(
                child: Hero(
                  tag:'NavigateToMainPageButton',
                  child: NavigateToMainPageButton(),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}