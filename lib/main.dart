import 'package:flutter/material.dart';
import 'package:flutter_day2_demo/ui/MoviesScreen/MovieScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MoviesScreen(title: 'Flutter Provider Demo'),
    );
  }
}
