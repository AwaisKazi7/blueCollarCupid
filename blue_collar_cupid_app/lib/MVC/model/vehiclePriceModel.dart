 class VehiclePrice {
  final int id;
  final String vehicleType;
  final double vehiclePrice;

  VehiclePrice({
    required this.id,
    required this.vehicleType,
    required this.vehiclePrice,
  });

  factory VehiclePrice.fromJson(Map<String, dynamic> json) {
    return VehiclePrice(
      id: json['id'],
      vehicleType: json['vehicleType'],
      vehiclePrice: (json['vehiclePrice'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicleType': vehicleType,
      'vehiclePrice': vehiclePrice,
    };
  }
}