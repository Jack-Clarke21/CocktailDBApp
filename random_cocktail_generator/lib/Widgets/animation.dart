import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedTextSwitcher extends StatefulWidget {
  const AnimatedTextSwitcher({super.key});

  @override
  State<AnimatedTextSwitcher> createState() => _AnimatedTextSwitcherState();
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
    Timer.periodic(const Duration(seconds: 1), (timer) {
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
          duration: const Duration(seconds: 0),
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

