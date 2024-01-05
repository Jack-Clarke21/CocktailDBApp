
class CocktailData {
  final String strDrink;
  final String strGlass;
  final String strDrinkThumb;
  final String strInstructions;
  final List<String> ingredients;
  final List<String> measures;

  CocktailData({
    required this.strDrink,
    required this.strGlass,
    required this.strDrinkThumb,
    required this.strInstructions,
    required this.ingredients,
    required this.measures,
  });

  factory CocktailData.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    // Extract the ingredients and measures from JSON that aren't null
    for (int i = 1; i <= 15; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? ''); // Use an empty string if measure is null
      }
    }

    return CocktailData(
      strDrink: json['strDrink'],
      strGlass: json['strGlass'],
      strDrinkThumb: json['strDrinkThumb'],
      strInstructions: json['strInstructions'],
      ingredients: ingredients,
      measures: measures,
    );
  }
}