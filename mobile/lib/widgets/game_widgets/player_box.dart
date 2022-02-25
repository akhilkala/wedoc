import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wedoc/models/player_model.dart';

class PlayerBox extends StatelessWidget {
  late Player player;
  late bool sameTeam;
  late int teamColor;
  late bool myTurn;

  PlayerBox(
      {required this.player,
      required this.sameTeam,
      required this.teamColor,
      required this.myTurn,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Color(teamColor)),
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: EdgeInsets.all(sameTeam ? 4.0 : 8.0),
            child: sameTeam
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 10),
                      Text(player.playerName),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person),
                      SizedBox(height: 5),
                      Text(player.playerName
                          .replaceAllMapped(" ", (match) => "\n")),
                    ],
                  ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        myTurn
            ? Container(
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  child: Text("Turn"),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              )
            : Container()
      ],
    );
  }
}
