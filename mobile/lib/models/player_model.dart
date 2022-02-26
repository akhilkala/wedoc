import 'dart:convert';

class Player {
  String playerName;
  String playerID;
  Player({
    required this.playerName,
    required this.playerID,
  });

  Player copyWith({
    String? playerName,
    String? playerID,
  }) {
    return Player(
      playerName: playerName ?? this.playerName,
      playerID: playerID ?? this.playerID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'playerName': playerName,
      'playerID': playerID,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      playerName: map['playerName'] ?? '',
      playerID: map['playerID'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) => Player.fromMap(json.decode(source));

  @override
  String toString() => 'Player(playerName: $playerName, playerID: $playerID)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Player &&
        other.playerName == playerName &&
        other.playerID == playerID;
  }

  @override
  int get hashCode => playerName.hashCode ^ playerID.hashCode;
}
