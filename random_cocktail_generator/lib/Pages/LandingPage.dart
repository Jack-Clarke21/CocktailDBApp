import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/Widgets/Buttons.dart';
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
        );
  }
}
