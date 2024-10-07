class PlaceModel {
  String description;
  String placeId;
  String reference;

  PlaceModel({
    required this.description,
    required this.placeId,
    required this.reference,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      description: json['description'],
      placeId: json['place_id'],
      reference: json['reference'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'place_id': placeId,
      'reference': reference,
    };
  }
}
