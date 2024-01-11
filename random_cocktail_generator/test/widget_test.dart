import 'package:flutter_test/flutter_test.dart';
import 'package:random_cocktail_generator/cocktail_data.dart';

void main() {
  group('CocktailData Tests', () {
    test('CocktailData.fromJson() creates a valid object', () {
      final json = {
        'strDrink': 'Tequila Shot',
        'strGlass': 'Shot glass',
        'strDrinkThumb':
            'https://www.thecocktaildb.com/images/media/drink/ywtrvt1441246783.jpg',
        'strInstructions': 'Pour and enjoy!',
        'strIngredient1': 'Tequila',
        'strMeasure1': '25 ml',
      };

      final cocktailData = CocktailData.fromJson(json);

      expect(cocktailData.strDrink, equals('Tequila Shot'));
      expect(cocktailData.strGlass, equals('Shot glass'));
      expect(cocktailData.strDrinkThumb,equals('https://www.thecocktaildb.com/images/media/drink/ywtrvt1441246783.jpg'));
      expect(cocktailData.strInstructions, equals('Pour and enjoy!'));
      expect(cocktailData.ingredientsAndMeasures[0].values, equals(['Tequila: 25 ml']));
    });

    ;
  });
}
