import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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


class CocktailPage extends StatelessWidget {
  final CocktailData data;

  CocktailPage({required this.data});

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
              textAlign: TextAlign.center,
            ),
            Text(
              'Made in a ${data.strGlass}',
              style: const TextStyle(color: Colors.white, fontSize: 20,),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-2.0, 0.0), // Slide from the left
                end: Offset.zero,
              ).animate(CurvedAnimation(
                curve: Curves.easeOut,
                parent: ModalRoute.of(context)!.animation!,
              )),
              child: Hero(
                tag: 'cocktailImage_${data.strDrink}',
                child: Container(
                  width: 340,
                  height: 340,
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Image.network(data.strDrinkThumb),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  ShowCocktailInformation(data: data),
                  Hero(
                    tag:"GenerateCocktailButton", 
                    child: GenerateCocktailButton()
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CocktailPageWithInfo extends StatelessWidget {
  final CocktailData data;

  CocktailPageWithInfo({required this.data});

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
            // Fade in Text
            Text(
              data.strDrink,
              style: const TextStyle(color: Colors.white, fontSize: 50),
              textAlign: TextAlign.center,
            ),

            // Fade in Text
            Text(
              'Made in a ${data.strGlass}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'cocktailImage_${data.strDrink}',
                  child: Container(
                    width: 220,
                    height: 220,
                    margin: const EdgeInsets.only(right: 10.0),
                    child: Image.network(data.strDrinkThumb),
                  ),
                ),

                // Slide in Container
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    curve: Curves.easeInOut,
                    parent: ModalRoute.of(context)!.animation!,
                  )),
                  child: Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            data.strInstructions,
                            style: const TextStyle(color: Colors.white, fontSize: 14, fontStyle: FontStyle.italic),
                          ),
                        ),
                        // Display ingredients and measures
                        for (int i = 0; i < data.ingredients.length; i++)
                          Text(
                            '${data.ingredients[i]}: ${data.measures[i]}',
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.all(20.0),
              child: const Hero(
                tag: 'GenerateCocktailButton',
                child: GenerateCocktailButton()
                ),
            ),
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
    child: Container(
      margin: EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () async {
          CocktailData data = await fetchCocktailData();
          await navigateToCocktailPage(context, data);
        },
        child: Text('Show me a Cocktail'),
      ),
    ),
  );
}

  Future<void> navigateToCocktailPage(BuildContext context, CocktailData data) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 900), 
        pageBuilder: (context, animation, secondaryAnimation) {
          const begin = Offset(3.0, 0.05);
          const end = Offset.zero;
          var fastEaseInToSlowEaseOutCurve = Curves.fastEaseInToSlowEaseOut; // You can adjust the curve

          var tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: fastEaseInToSlowEaseOutCurve));

          return SlideTransition(
            position: animation.drive(tween),
            child: CocktailPage(data: data),
          );
        },
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
  final CocktailData data; 

  const ShowCocktailInformation({required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (context, animation, secondaryAnimation) {
                const begin = Offset(0.0, 0.0);
                const end = Offset.zero;
                var fastEaseInToSlowEaseOutCurve = Curves.fastEaseInToSlowEaseOut; 

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: fastEaseInToSlowEaseOutCurve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: CocktailPageWithInfo(data: data),
                );
              },
              )
            );
          },
          child: Text('Show me how to make'),
        ),
      ),
    );
  }
}

