import 'package:flutter/material.dart';
import 'dart:async';
import 'package:random_cocktail_generator/CocktailData.dart';
import 'package:random_cocktail_generator/CocktailRepository.dart';
import 'package:random_cocktail_generator/Pages/InfoPage.dart';
import 'package:random_cocktail_generator/Pages/MainPage.dart';


class GenerateCocktailButton extends StatelessWidget {
  const GenerateCocktailButton({super.key});

@override
Widget build(BuildContext context) {
  return Center(
    child: Container(
      margin: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () async {
          CocktailData data = await fetchCocktailData();
          await navigateToCocktailPage(context, data);
        },
        child: const Text('Show me a Cocktail'),
      ),
    ),
  );
}

  Future<void> navigateToCocktailPage(BuildContext context, CocktailData data) async {
    await Future.delayed(const Duration(milliseconds: 140));
    // ignore: use_build_context_synchronously
    await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 900), 
        pageBuilder: (context, animation, secondaryAnimation) {
          const begin = Offset(3.0, 0.05);
          const end = Offset.zero;
          var fastEaseInToSlowEaseOutCurve = Curves.fastEaseInToSlowEaseOut; // You can adjust the curve

          var tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: fastEaseInToSlowEaseOutCurve));

          return SlideTransition(
            position: animation.drive(tween),
            child: CocktailPage(data: data),
          );
        },
      ),
    );
  }
}




class NavigateToCocktailInfoButton extends StatelessWidget {
  final CocktailData data; 

  const NavigateToCocktailInfoButton({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (context, animation, secondaryAnimation) {
                const begin = Offset(0.0, 0.0);
                const end = Offset.zero;
                var fastEaseInToSlowEaseOutCurve = Curves.fastEaseInToSlowEaseOut; 

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: fastEaseInToSlowEaseOutCurve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: CocktailPageWithInfo(data: data),
                );
              },
              )
            );
          },
          child: const Text('Show me how to make'),
        ),
      ),
    );
  }
}

