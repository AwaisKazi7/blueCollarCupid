class VehicleModel {
  final String vehicleMake;
  final String vehicleModel;
  final String vehicleNumber;
  final String vehicleColor;
  final String vehicleRegistrationNumber;
  final String vehicleExpiryDate;

  VehicleModel({
    required this.vehicleMake,
    required this.vehicleModel,
    required this.vehicleNumber,
    required this.vehicleColor,
    required this.vehicleRegistrationNumber,
    required this.vehicleExpiryDate,
  });

  // Factory constructor to create an instance from a map
  factory VehicleModel.fromMap(Map<String, dynamic> map) {
    return VehicleModel(
      vehicleMake: map['vehicleMake'],
      vehicleModel: map['vehicleModel'],
      vehicleNumber: map['vehicleNumber'],
      vehicleColor: map['vehicleColor'],
      vehicleRegistrationNumber: map['vehicleRegistrationNumber'],
      vehicleExpiryDate: map['vehicleExpiryDate'],
    );
  }

  // Method to convert an instance to a map
  Map<String, dynamic> toMap() {
    return {
      'vehicleMake': vehicleMake,
      'vehicleModel': vehicleModel,
      'vehicleNumber': vehicleNumber,
      'vehicleColor': vehicleColor,
      'vehicleRegistrationNumber': vehicleRegistrationNumber,
      'vehicleExpiryDate': vehicleExpiryDate,
    };
  }
}
