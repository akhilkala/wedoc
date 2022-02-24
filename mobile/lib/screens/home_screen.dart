import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wedoc/view_models/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Center(
        child: Text("Something"),
      ),
    );
  }
}
