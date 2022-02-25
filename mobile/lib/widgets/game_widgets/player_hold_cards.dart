import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

class CircularStackListView extends StatefulWidget {
  late List<String> items;
  late int scale;
  late bool myCards;

  CircularStackListView(
      {required this.items,
      required this.scale,
      required this.myCards,
      Key? key})
      : super(key: key);

  @override
  State<CircularStackListView> createState() => _CircularStackListViewState();
}

class _CircularStackListViewState extends State<CircularStackListView> {
  final random = math.Random();
  late SharedPreferences? pref;
  late int cardSelected = -1;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  initPrefs() async {
    final _pref = SharedPreferences.getInstance();
    pref = await _pref;

    cardSelected = pref!.getInt("CARD_SELECTED") ?? -1;
  }

  changeList(int position) async {
    cardSelected = pref!.getInt("CARD_SELECTED") ?? -1;
    if (cardSelected == position) {
      await pref!.setInt("CARD_SELECTED", -1);
    } else {
      await pref!.setInt("CARD_SELECTED", position);
    }

    setState(() {
      cardSelected = pref!.getInt("CARD_SELECTED") ?? -1;
      print(cardSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.myCards ? 50.0 * widget.scale : 35.0 * widget.scale,
        width: (25.0 * widget.scale + ((widget.items.length - 1) * 30)),
        child: Stack(
          children: [
            for (int i = 0; i < widget.items.length; i++)
              PlayerCard(
                position: i,
                card: widget.items[i],
                selectedCard: cardSelected,
                changeSelectedCard: changeList,
                scale: widget.scale,
                myCard: widget.myCards,
              )
          ],
        ),
      ),
    );
  }
}

class PlayerCard extends StatefulWidget {
  late int position;
  late String card;
  Function(int) changeSelectedCard;
  late int selectedCard;
  late int scale;
  late bool myCard;

  PlayerCard({
    Key? key,
    required this.position,
    required this.card,
    required this.selectedCard,
    required this.changeSelectedCard,
    required this.scale,
    required this.myCard,
  }) : super(key: key);

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  onCardSelect() async {
    setState(() {
      widget.changeSelectedCard(widget.position);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position * 30,
      bottom: widget.myCard
          ? widget.selectedCard == widget.position
              ? 50
              : 0
          : 0,
      child: GestureDetector(
        onTap: () {
          onCardSelect();
        },
        child: Column(
          children: [
            widget.myCard
                ? widget.selectedCard == widget.position
                    ? InkWell(
                        onTap: () {
                          //TODO: Implement Play Function!
                        },
                        child: Container(
                            width: 25.0 * widget.scale,
                            height: 25.0,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Colors.white
                                    ])),
                            child: Center(
                                child: Text(
                              "Play",
                              style: Theme.of(context).textTheme.button,
                            ))),
                      )
                    : Container()
                : Container(),
            Image.asset(
              widget.card,
              width: 25.0 * widget.scale,
              height: 35.0 * widget.scale,
            ),
          ],
        ),
      ),
    );
  }
}
