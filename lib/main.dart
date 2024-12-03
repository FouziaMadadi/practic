import 'dart:ui';

import 'package:demo/constants.dart';
import 'package:demo/screens/landingScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  //static PlatformDispatcher get instance => instance;
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

   // double screenWidth = PlatformDispatcher as double;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Episode 1',
      theme: ThemeData(primaryColor: COLOR_WHITE, hintColor: COLOR_DARK_BLUE, fontFamily: 'Montserrat'),
    home: Landingscreen(),
    );
  }
}
//textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,