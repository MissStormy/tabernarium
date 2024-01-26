class Game {
  final String title;
  //final String creator;
  final String players;
  final String location;
  final String description;

  Game({
    required this.title,
    //required this.creator,
    required this.players,
    required this.location,
    required this.description,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      title: json['title'] ?? '',
      //creator: json['creator'] ?? '',
      players: json['players'] ?? '',
      location: json['location'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
