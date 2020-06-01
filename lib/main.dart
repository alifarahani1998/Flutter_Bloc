import 'package:flutter/material.dart';
import 'package:flutterapp/ui/HomePage.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "First Bloc Application",
      theme: ThemeData(
        primaryColor: Colors.orange

    ),
    home: HomePage(),
    );
  }
}
