import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themed_calculator/screens/HomeCalc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:toggle_switch/toggle_switch.dart';


void main(){
  
  runApp(MyApp());
  
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeCalc(),
    );
  }
}







