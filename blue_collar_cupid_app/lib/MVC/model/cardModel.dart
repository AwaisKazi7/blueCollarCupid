class MatchCard {
  final String name;
  final String picture; // You can use an image URL or an asset path
  final String address;

  MatchCard({
    required this.name,
    required this.picture,
    required this.address,
  });

  // Factory constructor to create a MatchCard from a Map
  factory MatchCard.fromJson(Map<String, dynamic> json) {
    return MatchCard(
      name: json['name'],
      picture: json['picture'],
      address: json['address'],
    );
  }

  // Convert the MatchCard to a Map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'picture': picture,
      'address': address,
    };
  }
}
