import 'package:flutter/material.dart';

enum AppColor {
  primaryColor,
  secondaryColor,
  textColor,
  buttonTextColor,
  backgroundColor,
  shadowColor,
  // Add more color variables as needed
}

class AppColors {
  static const Map<AppColor, Color> colorMap = {
    AppColor.primaryColor: Color.fromARGB(255, 60, 72, 236),
    AppColor.secondaryColor: Color.fromARGB(255, 137, 120, 213),
    AppColor.textColor: Colors.white,
    AppColor.buttonTextColor: Color.fromARGB(255, 218, 168, 191),
    AppColor.backgroundColor: Colors.black,
    AppColor.shadowColor: Color.fromARGB(108, 156, 113, 217),
    // Assign colors for each enum value
  };
 static Color getColor(AppColor color) {
    return colorMap[color] ?? Colors.black; // Default to black if color is not found
  }
}


//Collect colors needed here
//foregroundColor: const Color.fromARGB(255, 218, 168, 191)
//backgroundColor: const Color.fromARGB(255, 60, 72, 236),
//disabledForegroundColor: const Color.fromARGB(255, 137, 120, 213),
//shadowColor: const Color.fromARGB(137, 156, 113, 217)
//style: const TextStyle(color: Colors.white, fontSize: 50),

//Box Shadow-
//color: Color.fromARGB(108, 156, 113, 217),
