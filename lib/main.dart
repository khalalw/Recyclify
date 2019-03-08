import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './pages/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightGreen,
      ),
      home: HomePage(),
    );
  }
}
