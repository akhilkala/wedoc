import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wedoc/models/team_model.dart';

class ScoreBoard extends StatelessWidget {
  late Team teamOne;
  late Team teamTwo;
  ScoreBoard({required this.teamOne, required this.teamTwo, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          // TEAM ONE
          Expanded(
              child: Column(
            children: [
              Text(teamOne.teamName,
                  style: Theme.of(context).textTheme.headline6),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Center(
                        child: Text("Points: " + teamOne.teamScore.toString())),
                  ),
                  Container(
                      width: 1, height: 20, color: Color(teamOne.teamColor)),
                  Expanded(
                    child: Center(
                        child: Text("Sets: " + teamOne.teamScore.toString())),
                  ),
                ],
              )),
            ],
          )),
          // DIVIDER
          Container(
            width: 1,
            color: Colors.grey,
          ),
          // TEAM TWO
          Expanded(
              child: Column(
            children: [
              Text(teamTwo.teamName,
                  style: Theme.of(context).textTheme.headline6),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Center(
                        child: Text("Points: " + teamTwo.teamScore.toString())),
                  ),
                  Container(
                      width: 1, height: 20, color: Color(teamTwo.teamColor)),
                  Expanded(
                    child: Center(
                        child: Text("Sets: " + teamTwo.teamScore.toString())),
                  ),
                ],
              )),
            ],
          )),
        ],
      ),
    );
  }
}
