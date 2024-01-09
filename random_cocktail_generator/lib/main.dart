import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/Pages/LandingPage.dart';
import 'package:random_cocktail_generator/router.dart';


void main() {
  AppRouter.setupRouter();
  runApp(const LandingPage());
}
