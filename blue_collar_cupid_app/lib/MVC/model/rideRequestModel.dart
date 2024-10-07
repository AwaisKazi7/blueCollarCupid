class RideRequestModel {
  final LocationPoint pickupLocation;
  final LocationPoint dropoffLocation;
  final int fare;
  final String userId;
  final String userLocation;
  final String rideId;
  final String category;

  RideRequestModel({
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.fare,
    required this.userId,
    required this.userLocation,
    required this.rideId,
    required this.category,
  });

  // Factory constructor to create a Ride instance from JSON
  factory RideRequestModel.fromJson(Map<String, dynamic> json) {
    return RideRequestModel(
      pickupLocation: LocationPoint.fromJson(json['pickupLocation']),
      dropoffLocation: LocationPoint.fromJson(json['dropoffLocation']),
      fare: json['fare'],
      userId: json['userId'],
      userLocation: json['userLocation'],
      rideId: json['rideId'],
      category: '',
      //  json['category'],
    );
  }

  // Method to convert a Ride instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'pickupLocation': pickupLocation.toJson(),
      'dropoffLocation': dropoffLocation.toJson(),
      'fare': fare,
      'userId': userId,
      'userLocation': userLocation,
      'rideId': rideId,
    };
  }
}

// Subclass for Location
class LocationPoint {
  final double lat;
  final double lon;

  LocationPoint({
    required this.lat,
    required this.lon,
  });

  // Factory constructor to create a Location instance from JSON
  factory LocationPoint.fromJson(Map<String, dynamic> json) {
    return LocationPoint(
      lat: json['lat'],
      lon: json['lon'],
    );
  }

  // Method to convert a Location instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }
}
