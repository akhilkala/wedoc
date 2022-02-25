import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:wedoc/models/player_model.dart';

class Team {
  String teamName;
  int teamScore;
  List<Player> players;
  int teamColor;
  Team({
    required this.teamName,
    this.teamScore = 0,
    required this.players,
    required this.teamColor,
  });

  Team copyWith({
    String? teamName,
    int? teamScore,
    List<Player>? players,
    int? teamColor,
  }) {
    return Team(
      teamName: teamName ?? this.teamName,
      teamScore: teamScore ?? this.teamScore,
      players: players ?? this.players,
      teamColor: teamColor ?? this.teamColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'teamScore': teamScore,
      'players': players.map((x) => x.toMap()).toList(),
      'teamColor': teamColor,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      teamName: map['teamName'] ?? '',
      teamScore: map['teamScore']?.toInt() ?? 0,
      players: List<Player>.from(map['players']?.map((x) => Player.fromMap(x))),
      teamColor: map['teamColor']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Team(teamName: $teamName, teamScore: $teamScore, players: $players, teamColor: $teamColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Team &&
        other.teamName == teamName &&
        other.teamScore == teamScore &&
        listEquals(other.players, players) &&
        other.teamColor == teamColor;
  }

  @override
  int get hashCode {
    return teamName.hashCode ^
        teamScore.hashCode ^
        players.hashCode ^
        teamColor.hashCode;
  }
}
