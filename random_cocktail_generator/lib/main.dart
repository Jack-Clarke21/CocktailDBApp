import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Text Switcher'),
        ),
        body: Center(
          child: AnimatedTextSwitcher(),
        ),
      ),
    );
  }
}


class AnimatedTextSwitcher extends StatefulWidget {
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


