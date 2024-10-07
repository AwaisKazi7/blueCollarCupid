import 'dart:developer';

import 'package:blue_collar_cupid_app/MVC/model/authModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/app_service.dart';

class DataStroge extends GetxController {
  static DataStroge? _instance;
  static DataStroge get getInstance => _instance ??= DataStroge();
  late SharedPreferences _pref;

  late Map<String, dynamic> headersMap;

  Future<SharedPreferences> _initPrefs() async {
    _pref = await SharedPreferences.getInstance();
    return _pref;
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static RxString userName = ''.obs;
  static RxString FullName = ''.obs;
  static RxString userRole = ''.obs;
  static RxString userEmail = ''.obs;
  static RxString userDOB = ''.obs;
  static RxString userGender = ''.obs;
  static RxString userImage = ''.obs;
  static RxString userPhone = ''.obs;
  static RxString userToken = ''.obs;
  static RxString fcmToken = ''.obs;
  static RxString DeviceID = ''.obs;
  static RxString currentUserId = ''.obs;
  static RxString DVS = ''.obs;

  Future initiateSession() async {
    log("initiateSession called");
    await _initPrefs();
    headersMap = {
      'Authorization': 'Bearer ${_pref.getString('token')}',
    };

    AppService.getInstance.updateDioHeaders();
  }

  Future<void> insertUserData(authModel userData) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.setString('token', userData.token);
    await prefs.setString('id', userData.id.toString());
    await prefs.setString('fullName', userData.fullName);
    await prefs.setString('userName', userData.userName);
    await prefs.setString('email', userData.email);
    await prefs.setString('role', userData.userRole);
    await prefs.setString('DVS', userData.dvs);

    // Initiate the session
    await initiateSession();
    FullName.value = userData.fullName;
    userName.value = userData.userName;
    userEmail.value = userData.email;
    userRole.value = userData.userRole;
    userToken.value = userData.token;
    DVS.value = userData.dvs;
    currentUserId.value = userData.id.toString();
  }

  insertDeviceAndFCMInformation({FcmToken, deviceID}) async {
    final SharedPreferences? prefs = await _prefs;
    await prefs?.setString('fcmToken', FcmToken);
    await prefs?.setString('DeviceID', deviceID);

    fcmToken.value = FcmToken;
    DeviceID.value = deviceID;
  }

  Future setTokenAuth(String authToken) async {
    await _initPrefs();
    _pref.setString('token', authToken);
    await initiateSession();
    return true;
  }

  updateUserData({username, fullname, photo}) async {
    final SharedPreferences? prefs = await _prefs;

    if (photo != "") {
      await prefs?.setString('photo', photo);

      userImage.value = photo;
    } else if (username != '') {
      await prefs?.setString('fullName', fullname);
      await prefs?.setString('userName', username);

      userName.value = username;
      FullName.value = fullname;
    }
  }

  getUserData() async {
    final SharedPreferences? prefs = await _prefs;
    userToken.value = prefs?.getString('token') ?? "";

    FullName.value = prefs?.getString('fullName') ?? "";
    userName.value = prefs?.getString('userName') ?? "";

    userEmail.value = prefs?.getString('email') ?? "";

    userRole.value = prefs?.getString('role') ?? "";

    currentUserId.value = prefs?.getString('id') ?? "";
  }

  logout() async {
    final SharedPreferences prefs = await _prefs;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await initiateSession();
    userRole.value = '';
    userName.value = '';
    userEmail.value = '';
    userImage.value = '';
    userPhone.value = '';
    userToken.value = '';
    currentUserId.value = '';
    // var tokenuser = prefs.getString('token') ?? "";
    log('Shared Preference Clear $userToken');
  }
}
