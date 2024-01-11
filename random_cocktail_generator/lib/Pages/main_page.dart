import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/cocktail_data.dart';
import 'package:random_cocktail_generator/cocktail_repository.dart';
import 'package:random_cocktail_generator/Widgets/app_colors.dart';
import 'package:random_cocktail_generator/Widgets/buttons.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  CocktailData? data;

  @override
  void initState() {
    super.initState();

    fetchCocktailData().then((response) {
      setState(() {
        data = response;
      });
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.getColor(AppColor.backgroundColor),
    body: data == null
        ? Center(
            child: CircularProgressIndicator(
              color: AppColors.getColor(AppColor.secondaryColor),
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 80.0),
                  child: Text(
                    data!.strDrink,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: AppColors.getColor(AppColor.textColor),
                      fontSize: 90,
                      height: 0.8,
                      textBaseline: TextBaseline.ideographic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                  child: Text(
                    'Made in a ${data!.strGlass}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w200,
                      color: AppColors.getColor(AppColor.textColor),
                      fontSize: 20,
                      height: 1.0,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Hero(
                          tag: 'cocktailImage_${data!.strDrink}',
                          child: Container(
                            //alignment: Alignment.topRight,
                            width: 348,
                            height: 400,
                            margin: const EdgeInsets.only(right: 40.0, bottom: 0),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(108, 156, 113, 217),
                                  spreadRadius: 10,
                                  blurRadius: 80,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child:
                              Image.network(
                                data!.strDrinkThumb,
                                fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 40.0),
                              child: NavigateToCocktailInfoButton(data: data!),
                            ),
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(-0.8, 0), // Slide from the left
                                end: Offset.zero,
                              ).animate(CurvedAnimation(
                                curve: Curves.easeOut,
                                parent: ModalRoute.of(context)!.animation!,
                              )),
                              child: const Hero(
                                tag: "NavigateToMainPageButton",
                                child: NavigateToMainPageButton(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
   );
  }
}
