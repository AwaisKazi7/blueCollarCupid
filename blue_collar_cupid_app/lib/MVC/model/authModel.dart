class authModel {
  int id;
  String fullName;
  String profilePicture;
  String userName;
  String email;
  String emailVerify;
  String status;
  String dvs;
  String userRole;
  String token;

  authModel({
    required this.id,
    required this.fullName,
    required this.profilePicture,
    required this.userName,
    required this.email,
    required this.emailVerify,
    required this.status,
    required this.dvs,
    required this.userRole,
    required this.token,
  });

  factory authModel.fromJson(Map<String, dynamic> json) {
    return authModel(
      id: json['id'],
      fullName: json['fullName'],
      profilePicture: json['profilePicture'] ?? 'null',
      userName: json['userName'],
      email: json['email'],
      emailVerify: json['emailVerify'],
      status: json['status'],
      dvs: json['dvs'],
      userRole: json['userRole'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'profilePicture': profilePicture,
      'userName': userName,
      'email': email,
      'emailVerify': emailVerify,
      'status': status,
      'dvs': dvs,
      'userRole': userRole,
      'token': token,
    };
  }
}
