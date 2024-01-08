import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/CocktailData.dart';
import 'package:random_cocktail_generator/Widgets/Buttons.dart';

class MainPage extends StatelessWidget {
  final CocktailData data;

  const MainPage ({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Cocktail Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              data.strDrink,
              style: const TextStyle(color: Colors.white, fontSize: 50),
              textAlign: TextAlign.center,
            ),
            Text(
              'Made in a ${data.strGlass}',
              style: const TextStyle(color: Colors.white, fontSize: 20,),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-3.0, 0.0), // Slide from the left
                end: Offset.zero,
              ).animate(CurvedAnimation(
                curve: Curves.easeOut,
                parent: ModalRoute.of(context)!.animation!,
              )),
              child: Hero(
                tag: 'cocktailImage_${data.strDrink}',
                child: Container(
                  width: 340,
                  height: 340,
                  margin: const EdgeInsets.only(top: 5.0),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(108, 156, 113, 217),
                        spreadRadius: 10,
                        blurRadius: 80,
                        offset: Offset(0, 15)
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(data.strDrinkThumb),
                  ) 
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  NavigateToCocktailInfoButton(data: data),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-0.8, 0), // Slide from the left
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      curve: Curves.easeOut,
                      parent: ModalRoute.of(context)!.animation!,
                    )),
                    child: const Hero(
                      tag:"NavigateToMainPageButton", 
                      child: NavigateToMainPageButton()
                      ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

