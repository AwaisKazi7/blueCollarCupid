import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:dio/src/form_data.dart' as getFormData;
import 'package:dio/src/multipart_file.dart' as getFormDataFile;
import '../helper/data_storage.dart';

class AppService {
  static AppService? _instance;
  static AppService get getInstance => _instance ??= AppService();

  late Dio dio;
  final _pref = DataStroge();

  AppService() {
    log("headerMap: ${DataStroge.getInstance.headersMap}");
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.API_HOST,
        headers: DataStroge.getInstance.headersMap,
      ),
    );
    print("[AppService] ${DataStroge.getInstance.headersMap}");
  }
  void updateDioHeaders() {
    if (dio != null) {
      dio.options.headers = DataStroge.getInstance.headersMap;
    }
  }

  // searchPlaceApi(BuildContext context, String placesName) async {
  //   try {
  //     var response = await dio.get(Constants.PlaceApi, queryParameters: {
  //       'input': placesName,
  //       'key': Constants.mapApiKey,
  //       'sessiontoken': '1234567890'
  //     });

  //     if (response.statusCode == 200) {
  //       log("searchPlaceApi API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       final responseData = response.data['predictions'];
  //       if (responseData is List) {
  //         List<PlaceModel> Datalist = (responseData as List)
  //             .map((data) => PlaceModel.fromJson(data))
  //             .toList();

  //         return Datalist;
  //       } else if (responseData is Map) {
  //         List<PlaceModel> Datalist = (responseData as List)
  //             .map((data) => PlaceModel.fromJson(data))
  //             .toList();

  //         return Datalist;
  //       }
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> login(
  //     BuildContext context, String email, String password) async {
  //   try {
  //     print(email);
  //     var response = await dio.post(Constants.loginApi,
  //         data: {"email": email, "password": password});

  //     if (response.statusCode == 202) {
  //       log("login API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       authModel UserData = authModel.fromJson(json['data']);

  //       log("userEmail ${UserData.email}");
  //       log("username ${UserData.userName}");
  //       log("userRole ${UserData.userRole}");
  //       log("DVS ${UserData.dvs}");

  //       await _pref.insertUserData(UserData);
  //       FlutterToastDisplay.getInstance.showToast("Welcome To carry app");
  //       if (UserData.userRole == 'USER') {
  //         Navigation.getInstance
  //             .pagePushAndReplaceNavigation(context, UserHomeScreen());
  //       } else {
  //         Navigation.getInstance
  //             .pagePushAndReplaceNavigation(context, DriverHomeScreen());
  //       }
  //     } else {
  //       print(response.statusCode);
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance
  //           .showToast("${e.response!.data['message']!}");
  //       print("Error msg data: ${e.response!}");
  //       if (e.response!.statusCode == 403) {
  //         Fluttertoast.showToast(msg: "${e.response!.data['message']}");
  //         await ResendOtp(context, email);

  //         Navigation.getInstance.RightToLeft_PageNavigation(
  //             context,
  //             otpVerificationScreen(
  //               email: e.response!.data['data']['email'],
  //               authid: e.response!.data['data']['id'],
  //               type: 'user',
  //             ));
  //       }
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // // ///Login Function
  // // ///It requires:
  // // ///1) Context
  // // ///2) User Object
  // // ///
  // // ///Return user object and OTP

  // Future<void> RegisterationApi(
  //     BuildContext context, UserModel userData, String type) async {
  //   try {
  //     var response = await dio.post(Constants.RegisterApi, data: {
  //       "email": userData.email,
  //       "deviceId": userData.deviceId,
  //       "fcmToken": userData.fcmToken,
  //       "password": userData.password,
  //       "fullName": userData.fullName,
  //       "userName": userData.userName,
  //       "userName": userData.userName,
  //       "phonenumber": userData.phoneNumber,
  //       "ssn": userData.ssn
  //     });

  //     if (response.statusCode == 200) {
  //       log("Registeration API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //       Navigation.getInstance.RightToLeft_PageNavigation(
  //           context,
  //           otpVerificationScreen(
  //             email: userData.email,
  //             authid: response.data['data'],
  //             type: type,
  //           ));
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance
  //           .showToast("${e.response!.data['message']}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // RegisterationwithTokenApi(
  //     BuildContext context, UserModel userData, String type) async {
  //   try {
  //     var response =
  //         await dio.post(Constants.RegisterdriverwithtokenApi, data: {
  //       "email": userData.email,
  //       "deviceId": userData.deviceId,
  //       "fcmToken": userData.fcmToken,
  //       "password": userData.password,
  //       "fullName": userData.fullName,
  //       "userName": userData.userName,
  //       'phonenumber':userData.phoneNumber,
  //       "ssn": userData.ssn
  //     });

  //     if (response.statusCode == 200) {
  //       log("Registeration API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       DataStroge.userEmail.value = response.data['data']['email'];
  //       DataStroge.userToken.value = response.data['data']['token'];
  //       DataStroge.currentUserId.value = response.data['data']['id'].toString();

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //       Navigation.getInstance.RightToLeft_PageNavigation(
  //           context,
  //           otpVerificationScreen(
  //             email: userData.email,
  //             authid: response.data['data']['id'],
  //             type: type,
  //           ));
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");

  //       return '';
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance
  //           .showToast("${e.response!.data['message']}");
  //       print("Error msg data: ${e.response!.data}");
  //       return '';
  //     } else {
  //       print("Error sending data: $e");
  //       return '';
  //     }
  //   }
  // }

  // Future<void> becomedriverApi(BuildContext context, String city, String state,
  //     String dob, String petAvilablity) async {
  //   try {
  //     var response = await dio.post(Constants.becomedriverApi,
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer ${DataStroge.userToken}',
  //           },
  //         ),
  //         data: {
  //           "city": city,
  //           "dob": dob,
  //           "petAvilablity": petAvilablity.toUpperCase(),
  //           "state": state
  //         });

  //     if (response.statusCode == 200) {
  //       log("becomedriverApi API =>${response.statusCode}👌✅");
  //       final json = response.data;
  //       print(json);
  //       // FlutterToastDisplay.getInstance
  //       //     .showToast("${response.data['message']}");
  //       // Navigation.getInstance.RightToLeft_PageNavigation(
  //       //     context,
  //       //     otpVerificationScreen(
  //       //       email: DriverData.email,
  //       //       authid: response.data['authid'],
  //       //       type: type,
  //       //     ));
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> VehicleDetailApi(
  //     BuildContext context, VehicleModel VehicleData) async {
  //   try {
  //     var response = await dio.post(Constants.vehicleinfoApi,
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer ${DataStroge.userToken}',
  //           },
  //         ),
  //         data: {
  //           "vehicleMake": VehicleData.vehicleMake,
  //           "vehicleModel": VehicleData.vehicleModel,
  //           "vehicleNumber": VehicleData.vehicleNumber,
  //           "vehicleColor": VehicleData.vehicleColor,
  //           "vehicleRegistrationNumber": VehicleData.vehicleRegistrationNumber,
  //           "vehicleExpiryDate": VehicleData.vehicleExpiryDate
  //         });

  //     if (response.statusCode == 200) {
  //       log("VehicleDetailApi API =>${response.statusCode}👌✅");
  //       final json = response.data;
  //       print(json);
  //       // FlutterToastDisplay.getInstance
  //       //     .showToast("${response.data['message']}");
  //       // Navigation.getInstance.RightToLeft_PageNavigation(
  //       //     context,
  //       //     otpVerificationScreen(
  //       //       email: DriverData.email,
  //       //       authid: response.data['authid'],
  //       //       type: type,
  //       //     ));
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> checkOtp(
  //     BuildContext context, String otpCode, int authId, String type) async {
  //   try {
  //     var response = await dio.post(Constants.CheckOtp_Api, data: {
  //       "otp": otpCode,
  //       // "time": DateTime.now(),
  //       "authId": authId
  //     });

  //     if (response.statusCode == 200) {
  //       log("checkOtp API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       UserModel UserData = UserModel.fromJson(json);

  //       Navigation.getInstance.RightToLeft_PageNavigation(
  //           context,
  //           SuccessfulScreen(
  //             heading: 'Registration Successful',
  //             content: 'User has been registered \nsuccessfully.',
  //             Btn_Text: 'Continue',
  //             onTap: () {
  //               if (type == 'user') {
  //                 Navigation.getInstance
  //                     .pagePushAndReplaceNavigation(context, SignInScreen());
  //               }
  //               // else if (type == 'forgetpassword') {
  //               //   Navigation.getInstance.pagePushAndReplaceNavigation(
  //               //       context, SetNewPasswordScreen(email: ,));
  //               // }
  //               else {
  //                 Navigation.getInstance.RightToLeft_PageNavigation(
  //                     context, DriverInfoFormScreen());
  //               }
  //             },
  //           ));
  //     } else if (response.statusCode == 202) {
  //       log("checkOtp API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       // UserModel UserData = UserModel.fromJson(json);

  //       Navigation.getInstance.RightToLeft_PageNavigation(
  //           context,
  //           SuccessfulScreen(
  //             heading: 'Registration Successful',
  //             content: 'User has been registered \nsuccessfully.',
  //             Btn_Text: 'Continue',
  //             onTap: () {
  //               if (type == 'user') {
  //                 Navigation.getInstance
  //                     .pagePushAndReplaceNavigation(context, SignInScreen());
  //               } else {
  //                 Navigation.getInstance.RightToLeft_PageNavigation(
  //                     context, DriverInfoFormScreen());
  //               }
  //             },
  //           ));
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance
  //           .showToast("${e.response!.data['message']}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> forgetPassword(
  //     BuildContext context, String otpCode, String email) async {
  //   try {
  //     var response = await dio.post(Constants.forgetPassword_Api, data: {
  //       "otp": otpCode,
  //       //  "time": DateTime.now(),
  //       "email": email
  //     });

  //     if (response.statusCode == 200) {
  //       log("forgetPassword API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       Navigation.getInstance.pagePushAndReplaceNavigation(
  //           context,
  //           SetNewPasswordScreen(
  //             email: email,
  //           ));
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance
  //           .showToast("${e.response!.data['message']}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> SetNewPassword(
  //     BuildContext context, String newpassword, String email) async {
  //   try {
  //     var response = await dio.post(Constants.changepassword_Api,
  //         data: {"newPassword": newpassword, "email": email});

  //     if (response.statusCode == 200) {
  //       log("SetNewPassword API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       Navigation.getInstance
  //           .pagePushAndReplaceNavigation(context, SignInScreen());
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance
  //           .showToast("${e.response!.data['message']}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future ResendOtp(BuildContext context, String email) async {
  //   try {
  //     var response = await dio.post(Constants.resendOtp_driver, data: {
  //       "email": email,
  //     });

  //     if (response.statusCode == 202) {
  //       log("ResendOtp API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");

  //       return true;
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       print(response.statusCode);
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");

  //       return false;
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //     return false;
  //   }
  // }

  // getvehilcePrics(BuildContext context) async {
  //   try {
  //     var response = await dio.get(
  //       Constants.getvehilcePrics_Api,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${DataStroge.userToken}',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       log("getvehilcePrics API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       final responseData = response.data['data'];
  //       if (responseData is List) {
  //         List<VehiclePrice> Datalist = (responseData as List)
  //             .map((data) => VehiclePrice.fromJson(data))
  //             .toList();

  //         return Datalist;
  //       } else if (responseData is Map) {
  //         List<VehiclePrice> Datalist = (responseData as List)
  //             .map((data) => VehiclePrice.fromJson(data))
  //             .toList();

  //         return Datalist;
  //       }
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> editProfile(
  //     BuildContext context, String username, String fullname) async {
  //   try {
  //     var response = await dio.put(Constants.editprofile_Api,
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer ${DataStroge.userToken}',
  //           },
  //         ),
  //         data: {"userName": username, "fullName": fullname});

  //     if (response.statusCode == 200) {
  //       log("editProfile API =>${response.statusCode}👌✅");
  //       await _pref.updateUserData(
  //           username: username, fullname: fullname, photo: '');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //       Navigator.pop(context);
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance
  //           .showToast("${e.response!.data['message']}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> switchRole(BuildContext context) async {
  //   try {
  //     var response = await dio.put(
  //       Constants.switchroleApi,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${DataStroge.userToken}',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       print('switch to driver 👌✅');
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance
  //           .showToast("${e.response!.data['message']}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> uploadProfilepictureApi(
  //     BuildContext context, String image) async {
  //   try {
  //     final formData = getFormData.FormData();
  //     formData.files.add(MapEntry(
  //       'avatar',
  //       await getFormDataFile.MultipartFile.fromFile(image),
  //     ));

  //     // var data = FormData.fromMap({
  //     //   'avatar': [await MultipartFile.fromFile(image)],
  //     // });
      
  //     var response = await dio.put(
  //       Constants.uploadProfilepictureApi,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${DataStroge.userToken.value}',
  //         },
  //       ),
  //       data: formData,
  //     );

  //     if (response.statusCode == 200) {
  //       log("uploadProfilepictureApi API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //       // await _pref.updateUserData();
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance
  //           .showToast("${e.response!.data['message']}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> uploadprofileimage_Api(
  //     BuildContext context, String image) async {
  //   try {
  //     final formData = getFormData.FormData();
  //     formData.files.add(MapEntry(
  //       'avatar',
  //       await getFormDataFile.MultipartFile.fromFile(image),
  //     ));

  //     var response = await dio.put(
  //       Constants.uploadprofileimage_Api,
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${DataStroge.userToken}',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       log("uploadprofileimage_Api API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> uploadNationalId_Api(BuildContext context, String image) async {
  //   try {
  //     final formData = getFormData.FormData();
  //     formData.files.add(MapEntry(
  //       'idCard',
  //       await getFormDataFile.MultipartFile.fromFile(image),
  //     ));
  //     formData.fields.add(MapEntry('email', DataStroge.userEmail.value));
  //     formData.fields.add(MapEntry('id', DataStroge.currentUserId.value));
  //     var response = await dio.put(
  //       Constants.uploadNationalId_Api,
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${DataStroge.userToken}',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       log("uploadNationalId_Api API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> uploaddrivinglicense(BuildContext context, String image) async {
  //   try {
  //     print("uploaddrivinglicense");
  //     print("'email', ${DataStroge.userEmail.value}");
  //     print("'id', ${DataStroge.currentUserId.value}");
  //     final formData = getFormData.FormData();
  //     formData.files.add(MapEntry(
  //       'uploadLicensePicture',
  //       await getFormDataFile.MultipartFile.fromFile(image),
  //     ));
  //     formData.fields.add(MapEntry('email', DataStroge.userEmail.value));
  //     formData.fields.add(MapEntry('id', DataStroge.currentUserId.value));

  //     var response = await dio.put(
  //       Constants.vehiclelicenseApi,
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${DataStroge.userToken}',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       log("uploaddrivinglicense API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> uploadcriminalclearancecertificate(
  //     BuildContext context, String image) async {
  //   try {
  //     print("uploadcriminalclearancecertificate");
  //     print("'email', ${DataStroge.userEmail.value}");
  //     print("'id', ${DataStroge.currentUserId.value}");
  //     final formData = getFormData.FormData();
  //     formData.files.add(MapEntry(
  //       'criminalClearanceCertificate',
  //       await getFormDataFile.MultipartFile.fromFile(image),
  //     ));
  //     formData.fields.add(MapEntry('email', DataStroge.userEmail.value));
  //     formData.fields.add(MapEntry('id', DataStroge.currentUserId.value));

  //     var response = await dio.put(
  //       Constants.uploadcriminalclearancecertificateApi,
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${DataStroge.userToken}',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       log("uploadcriminalclearancecertificate API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> uploaddrivingtraningcertificates(
  //     BuildContext context, String image) async {
  //   try {
  //     print("uploaddrivingtraningcertificates");
  //     print("'email', ${DataStroge.userEmail.value}");
  //     print("'id', ${DataStroge.currentUserId.value}");
  //     final formData = getFormData.FormData();
  //     formData.files.add(MapEntry(
  //       'drivingTrainingCertificate',
  //       await getFormDataFile.MultipartFile.fromFile(image),
  //     ));
  //     formData.fields.add(MapEntry('email', DataStroge.userEmail.value));
  //     formData.fields.add(MapEntry('id', DataStroge.currentUserId.value));

  //     var response = await dio.put(
  //       Constants.uploaddrivingtraningcertificatesApi,
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${DataStroge.userToken}',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       log("uploaddrivingtraningcertificates API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> addRating(
  //     BuildContext context, double Rating, int driverId) async {
  //   try {
  //     var response = await dio.put(Constants.AddRating_Api,
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer ${DataStroge.userToken}',
  //           },
  //         ),
  //         data: {"driverId": driverId, "rating": Rating});

  //     if (response.statusCode == 200) {
  //       log("AddRating API =>${response.statusCode}👌✅");
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance
  //           .showToast("${e.response!.data['message']}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> addbankdetails(
  //   BuildContext context,
  //   String accountHolderName,
  //   String bankName,
  //   String accountNumber,
  //   String iban,
  //   String swiftCode,
  //   String routingNumber,
  // ) async {
  //   try {
  //     var response = await dio.post(Constants.Addbankdetails_Api, data: {
  //       "accountHolderName": accountHolderName,
  //       "bankName": bankName,
  //       "accountNumber": accountNumber,
  //       "iban": iban,
  //       "swiftCode": swiftCode,
  //       "routingNumber": routingNumber
  //     });

  //     if (response.statusCode == 200) {
  //       log("addbankdetails API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }
}
