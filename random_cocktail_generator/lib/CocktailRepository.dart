import 'package:random_cocktail_generator/CocktailData.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

String randomCocktailUrl = 'https://www.thecocktaildb.com/api/json/v1/1/random.php';

  //function for getting and CocktailDB JSON information  
  Future<CocktailData> fetchCocktailData() async {
  final response = await http.get(Uri.parse(randomCocktailUrl));
  if (response.statusCode == 200) {
    final data = json.decode(response.body)['drinks'][0];
    return CocktailData.fromJson(data);
  } else {
    throw Exception('Failed to load cocktail data');
  }
}