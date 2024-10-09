class MatchCard {
  final int id; // Added id field
  final String name;
  final List<String> picture;
  final String address;

  MatchCard({
    required this.id, // Initialize id in the constructor
    required this.name,
    required this.picture,
    required this.address,
  });

  // Factory constructor to create a MatchCard from a Map
  factory MatchCard.fromJson(Map<String, dynamic> json) {
    return MatchCard(
      id: json['id'], // Parse id from the Map
      name: json['name'],
      picture: List<String>.from(json['picture']), // Ensure picture is a List<String>
      address: json['address'],
    );
  }

  // Convert the MatchCard to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include id in the Map
      'name': name,
      'picture': picture,
      'address': address,
    };
  }
}
