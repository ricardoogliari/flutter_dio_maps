import 'package:flutter/material.dart';
import 'package:flutterdiomaps/screens/listTrucks.dart';
import 'package:flutterdiomaps/screens/mapa.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepOrange
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ListTrucks(),
        '/mapa': (context) => Mapa(),
      },
    );
  }
}
