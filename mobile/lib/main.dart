import 'package:flutter/material.dart';
import 'package:wedoc/screens/game_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyGameApplication());
}

class MyGameApplication extends StatelessWidget {
  const MyGameApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wedoc",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: GameScreen(),
    );
  }
}
