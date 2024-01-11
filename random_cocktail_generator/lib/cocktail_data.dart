class CocktailData {
  final String strDrink;
  final String strGlass;
  final String strDrinkThumb;
  final String strInstructions;
  final List<Map<String, String>> ingredientsAndMeasures;

  CocktailData({
    required this.strDrink,
    required this.strGlass,
    required this.strDrinkThumb,
    required this.strInstructions,
    required this.ingredientsAndMeasures,
  });

  factory CocktailData.fromJson(Map<String, dynamic> json) {
    List<Map<String, String>> ingredientsAndMeasures = [];

    for (int i = 1; i <= 15; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.isNotEmpty) {
        // If there is a measure, add it with the ingredient, otherwise just add the ingredient
        ingredientsAndMeasures.add({
          'ingredient': measure != null ? '$ingredient: $measure' : ingredient,
        });
      }
    }

    return CocktailData(
      strDrink: json['strDrink'],
      strGlass: json['strGlass'],
      strDrinkThumb: json['strDrinkThumb'],
      strInstructions: json['strInstructions'],
      ingredientsAndMeasures: ingredientsAndMeasures,
    );
  }
}
