import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/Widgets/buttons.dart';
import 'package:random_cocktail_generator/Widgets/animation.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
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
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: AnimatedTextSwitcher(),
                ),
                const SizedBox(height: 15.0,),
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
        );
  }
}
