import 'package:flutter/material.dart';
import 'package:wedoc/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(GameFrame());
}

class GameFrame extends StatelessWidget {
  const GameFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wedoc",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: HomeScreen(),
    );
  }
}
