import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/Widgets/buttons.dart';
import 'package:random_cocktail_generator/cocktail_data.dart';
import '../Widgets/app_colors.dart';

class CocktailInfoPage extends StatelessWidget {
  final CocktailData data;

  const CocktailInfoPage({super.key, required this.data, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColor(AppColor.backgroundColor),
      body: Container(
        margin: const EdgeInsets.only(top: 80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Column with Image and Button
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'cocktailImage_${data.strDrink}',
                  child: Container(
                    //constraints: const BoxConstraints(maxWidth: 420, maxHeight: 420, minWidth: 100),
                    width: 420,
                    height: 420,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.getColor(AppColor.shadowColor),
                          spreadRadius: 6,
                          blurRadius: 60,
                          offset: const Offset(-12, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(data.strDrinkThumb),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                const Hero(
                  tag: 'NavigateToMainPageButton',
                  child: NavigateToMainPageButton(),
                ),
              ],
            ),

            // Second Column with Title, Glass Type, Instructions, and Ingredients
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Container(
                      width: 400,
                      child: Text(
                        data.strDrink,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: AppColors.getColor(AppColor.textColor),
                          fontSize: 70,
                          height: 0.8,
                          textBaseline: TextBaseline.ideographic,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    // Glass Type
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Made in a ${data.strGlass}',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w200,
                          color: AppColors.getColor(AppColor.textColor),
                          fontSize: 16,
                          height: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                
                    // Instructions
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        curve: Curves.easeInOut,
                        parent: ModalRoute.of(context)!.animation!,
                      )),
                      child: SizedBox(
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.ingredientsAndMeasures
                                  .map((map) => map['ingredient'])
                                  .join('\n'), // Join ingredients with a new line
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                color: AppColors.getColor(AppColor.textColor),
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 40),
                            // Ingredients
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                softWrap: true,
                                data.strInstructions,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w200,
                                  color: AppColors.getColor(AppColor.textColor),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
