import 'package:flutter/material.dart';
import 'package:food_bit_app/app/app.dart';
import 'package:food_bit_app/app/tabs/home/details/details.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  void showConsoleUsingDebugPrint() {
 
    debugPrint('Console Message Using Debug Print');
 
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Cera Pro",
        primaryColor: Color(0xFFE85852),
      ),
      routes: {
        'details': (context) => Details(),
      },
      home: App(),
    );
  }
  
  
}
