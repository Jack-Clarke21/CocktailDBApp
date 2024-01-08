import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/CocktailData.dart';
import 'package:random_cocktail_generator/Widgets/Buttons.dart';

import '../Widgets/AppColors.dart';


class CocktailInfoPage extends StatelessWidget {
  final CocktailData data;

  const CocktailInfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColor(AppColor.backgroundColor),
      appBar: AppBar(
        title: const Text('Cocktail Details'),
      ),
      body: Center(
        child: Column(
          children: [
            // Fade in Text
            Text(
              data.strDrink,
              style: TextStyle(
                color: AppColors.getColor(AppColor.textColor),
                fontSize: 50
              ),
              textAlign: TextAlign.center,
            ),

            // Fade in Text
            Text(
              'Made in a ${data.strGlass}',
              style: TextStyle(
                color: AppColors.getColor(AppColor.textColor),
                fontSize: 20
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'cocktailImage_${data.strDrink}',
                  child: Container(
                    width: 220,
                    height: 220,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.getColor(AppColor.shadowColor), 
                        spreadRadius: 6,
                        blurRadius: 60,
                        offset: const Offset(-12, 6)
                      ),
                    ],
                  ),
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(data.strDrinkThumb),
                    )
                  ),
                ),

                // Slide in Container
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    curve: Curves.easeInOut,
                    parent: ModalRoute.of(context)!.animation!,
                  )),
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            data.strInstructions,
                            style: TextStyle(
                              color: AppColors.getColor(AppColor.textColor), 
                              fontSize: 14, 
                              fontStyle: FontStyle.italic
                              ),
                          ),
                        ),
                        // Display ingredients and measures
                        for (int i = 0; i < data.ingredients.length; i++)
                          Text(
                            '${data.ingredients[i]}: ${data.measures[i]}',
                            style: TextStyle(
                              color: AppColors.getColor(AppColor.textColor), 
                              fontSize: 18
                              ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.all(20.0),
              child: const Hero(
                tag: 'NavigateToMainPageButton',
                child: NavigateToMainPageButton()
                ),
            ),
          ],
        ),
      ),
    );
  }
}