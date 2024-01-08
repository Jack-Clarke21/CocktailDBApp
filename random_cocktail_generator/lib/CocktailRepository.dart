import 'package:random_cocktail_generator/CocktailData.dart';
import 'dart:async';
import 'package:dio/dio.dart';


const String randomCocktailUrl = 'https://www.thecocktaildb.com/api/json/v1/1/random.php';

Future<CocktailData> fetchCocktailData() async {
  try {
    final response = await Dio().get(randomCocktailUrl);
    if (response.statusCode == 200) {
      final data = response.data['drinks'][0];
      return CocktailData.fromJson(data);
    } else {
      throw Exception('Failed to load cocktail data');
    }
  } catch (error) {
    throw Exception('Failed to load cocktail data: $error');
  }
}
