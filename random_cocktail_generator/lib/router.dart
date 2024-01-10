import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:random_cocktail_generator/Pages/InfoPage.dart';
import 'package:random_cocktail_generator/Pages/LandingPage.dart';
import 'package:random_cocktail_generator/Pages/MainPage.dart';

class AppRouter {
  static FluroRouter router = FluroRouter();

  static void setupRouter() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      debugPrint("*** ROUTE WAS NOT FOUND ***");
      return LandingPage();
    });
    // Define routes using router.define(...)
    router.define(
      '/',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const LandingPage();
        },
      ),
    );

    router.define(
      '/main',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const MainPage();
        },
      ),
    );
  }
}
