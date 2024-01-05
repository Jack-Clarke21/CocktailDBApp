import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/Widgets/Buttons.dart';
import 'package:random_cocktail_generator/Widgets/animation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 218, 168, 191),
            backgroundColor: const Color.fromARGB(255, 60, 72, 236),
            disabledForegroundColor: const Color.fromARGB(255, 137, 120, 213),
            padding: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 102.0,
            shadowColor: const Color.fromARGB(137, 156, 113, 217)
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
                  tag:'GenerateCocktailButton',
                  child: GenerateCocktailButton()
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}