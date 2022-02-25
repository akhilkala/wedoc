import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wedoc/models/player_model.dart';
import 'package:wedoc/models/team_model.dart';
import 'package:wedoc/widgets/app_bar.dart';
import 'package:wedoc/widgets/game_widgets/player_box.dart';
import 'package:wedoc/widgets/game_widgets/player_hold_cards.dart';
import 'package:wedoc/widgets/game_widgets/score_board.dart';
import 'dart:math' as math;

class GameScreen extends StatelessWidget {
  late String cardAdd;

  GameScreen({Key? key}) : super(key: key) {
    final cardNum = math.Random().nextInt(8) + 2;
    cardAdd = "assets/cards/" + cardNum.toString() + "_of_clubs.png";
  }

  final teamOne = Team(
      teamName: "TeamA",
      players: [Player(playerName: "Charan", playerID: "playerOneID")],
      teamColor: Colors.blue.value);
  final teamTwo = Team(
      teamName: "TeamB",
      players: [Player(playerName: "Kotturi", playerID: "playerOneID")],
      teamColor: Colors.red.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 55,
              child: Container(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ScoreBoard(teamOne: teamOne, teamTwo: teamTwo),
            const SizedBox(height: 10),
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: PlayerBox(
                    player:
                        Player(playerID: "Playdsfa", playerName: "Player Name"),
                    sameTeam: true,
                    teamColor: teamOne.teamColor,
                    myTurn: false,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 1.0,
                          height: 125,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Theme.of(context).primaryColor),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.exit_to_app,
                                  size: 25,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("😂", textScaleFactor: 2.0),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("🤯", textScaleFactor: 2.0),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("🤥", textScaleFactor: 2.0),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("🐒", textScaleFactor: 2.0),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "High Card:",
                        style: Theme.of(context).textTheme.button,
                      ),
                      Text("6 of spades")
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                PlayerBox(
                  player:
                      Player(playerID: "Playdsfa", playerName: "Player Name"),
                  sameTeam: false,
                  teamColor: teamTwo.teamColor,
                  myTurn: true,
                ),
                // BTW OPP. TEAM PLAYERS
                Expanded(
                    child: Container(
                  child: CircularStackListView(
                    items: [cardAdd, cardAdd, cardAdd, cardAdd],
                    scale: 3,
                    myCards: false,
                  ),
                )),
                PlayerBox(
                  player:
                      Player(playerID: "Playdsfa", playerName: "Player Name"),
                  sameTeam: false,
                  teamColor: teamTwo.teamColor,
                  myTurn: false,
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            Expanded(
                child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 3; i++)
                    Row(children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                "assets/static_images/card_set.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                border: Border.all(
                                    color: Color(teamOne.teamColor),
                                    width: 1.0)),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text("Set  $i")
                        ],
                      )
                    ])
                ],
              ),
            )),
            CircularStackListView(
              items: [
                cardAdd,
                cardAdd,
                cardAdd,
                cardAdd,
                cardAdd,
                cardAdd,
                cardAdd,
                cardAdd
              ],
              scale: 6,
              myCards: true,
            ),
            const SizedBox(
              height: 40,
            ),
          ]),
    );
  }
}
