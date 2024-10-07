class UserModel {
  String email;
  String deviceId;
  String fcmToken;
  String password;
  String fullName;
  String userName;
  String phoneNumber;
  String ssn;

  UserModel({
    required this.email,
    required this.deviceId,
    required this.fcmToken,
    required this.password,
    required this.fullName,
    required this.userName,
    required this.phoneNumber,
    required this.ssn,
  });

  // Convert a DriverModel into a Map. The keys must correspond to the names of the JSON fields.
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'deviceId': deviceId,
      'fcmToken': fcmToken,
      'password': password,
      'fullName': fullName,
      'userName': userName,
      'phonenumber': phoneNumber,
      'ssn': ssn
    };
  }

  // A method that converts a map into a DriverModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      deviceId: json['deviceId'],
      fcmToken: json['fcmToken'],
      password: json['password'],
      fullName: json['fullName'],
      userName: json['userName'],
      phoneNumber: json['phonenumber'],
      ssn: json['ssn'],
    );
  }
}
