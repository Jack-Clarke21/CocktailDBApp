import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/Widgets/Buttons.dart';
import 'package:random_cocktail_generator/Widgets/animation.dart';
import '../Widgets/AppColors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        home:  Scaffold(
          backgroundColor: Colors.black,
          //appBar: AppBar(
           // elevation: 0,
           // title: const Text('Landing Page'),
          //),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                const Padding(
                  padding: EdgeInsets.only(bottom: 00.0),
                  child: AnimatedTextSwitcher(),
                ),
                Container(
                  margin: const EdgeInsets.all(0.0),
                  child: const Hero(
                    tag: 'NavigateToMainPageButton',
                    child: NavigateToMainPageButton(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
