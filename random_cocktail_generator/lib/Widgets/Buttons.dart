import 'package:flutter/material.dart';
import 'dart:async';
import 'package:random_cocktail_generator/CocktailData.dart';
import 'package:fluro/fluro.dart';
import 'package:random_cocktail_generator/Pages/info_page.dart';
import 'package:random_cocktail_generator/Pages/main_page.dart';
import 'package:random_cocktail_generator/router.dart'; 



class NavigateToMainPageButton extends StatelessWidget {
  const NavigateToMainPageButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //margin: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () async {
          
            AppRouter.router.navigateTo(
              context,
              '/main',
              transition: TransitionType.inFromRight,
            );
          },
          child: const Text(
            'Show me a Cocktail',
            style: TextStyle(fontSize: 12),
            ),
        ),
      ),
    );
  }



  Future<void> navigateToMainPage(BuildContext context, CocktailData data) async {
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
            child: MainPage(),
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
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>
            CocktailInfoPage(data: data),settings: RouteSettings(name: '/info/${data.strDrink}')
          ));
          //TO PLACE BACK IN ONE FORMATED ${data.strDrink}
      
              
          //   transitionDuration: const Duration(milliseconds: 900),
          //   pageBuilder: (context, animation, secondaryAnimation) {
          //     const begin = Offset(0.0, 0.0);
          //     const end = Offset.zero;
          //     var fastEaseInToSlowEaseOutCurve = Curves.fastEaseInToSlowEaseOut; 
      
          //     var tween = Tween(begin: begin, end: end)
          //         .chain(CurveTween(curve: fastEaseInToSlowEaseOutCurve));
      
          //     return SlideTransition(
          //       position: animation.drive(tween),
          //       child: CocktailInfoPage(data: data),
          //     );
          //   },
          //   )
          // );
        },
        child: const Text(
          'Show me how to make',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

