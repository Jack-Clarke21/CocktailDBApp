import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        body: const Column(
          children: <Widget>[
            Center(
              child: AnimatedTextSwitcher(),
            ),
            Center(
              child: GenerateCocktailButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class CocktailPage extends StatelessWidget {
  final CocktailData data;

  CocktailPage({required this.data});

  final TextStyle whiteTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 50, );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Cocktail Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              data.strDrink,
              style: const TextStyle(color: Colors.white, fontSize: 50),
              ),
            Text(
              'Made in a ${data.strGlass}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            Container(
              width: 300,
              height: 300,
              margin: const EdgeInsets.only(top: 5.0, bottom: 20.0),
              child: Image.network(data.strDrinkThumb),
            ),
            const Center(
              child: Column(
                children: [
                  ShowCocktailInformation(),
                  GenerateCocktailButton(),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}




class AnimatedTextSwitcher extends StatefulWidget {
  const AnimatedTextSwitcher({super.key});

  @override
  _AnimatedTextSwitcherState createState() => _AnimatedTextSwitcherState();
}

class _AnimatedTextSwitcherState extends State<AnimatedTextSwitcher> {
  int _currentIndex = 0;
  final List<String> words = ["Generate", "Cocktails", "Now"];
  final TextStyle textStyle = const TextStyle(
    fontFamily: 'Impact', 
    fontWeight: FontWeight.bold, 
    fontSize: 156, 
    color: Colors.white, 
  );

  @override
  void initState() {
    super.initState();
    // timer swaps words every Second
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % words.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, 
      width: double.infinity,
      height: 200, 
      child: Center(
        child: AnimatedSwitcher(
          duration: Duration(seconds: 0),
          child: FittedBox(
            fit: BoxFit.contain,
          child: Text(
            words[_currentIndex],
            key: Key(words[_currentIndex]),
            style: textStyle,
            )
          ),
        ),
      ),
    );
  }
}

class GenerateCocktailButton extends StatelessWidget {
  const GenerateCocktailButton({super.key});

 @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          CocktailData data = await fetchCocktailData();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CocktailPage(data: data),
            ),
          );
        },
        child: Text('Show me a Cocktail'),
      ),
    );
  }
}

//Class for storing API request from cocktailDB
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
  //function for getting and CocktailDB JSON information  
  Future<CocktailData> fetchCocktailData() async {
  final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body)['drinks'][0];
    return CocktailData.fromJson(data);
  } else {
    throw Exception('Failed to load cocktail data');
  }
}

class ShowCocktailInformation extends StatelessWidget {
  const ShowCocktailInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16.0), // Add margin here
        child: ElevatedButton(
          onPressed: () {
            // Display the rest of the information
          },
          child: Text('Show me how to make'),
        ),
      ),
    );
  }
}
