import 'dart:developer';
import 'package:blue_collar_cupid_app/MVC/view/loginScreen/loginWithPhoneScreen.dart';
import 'package:blue_collar_cupid_app/components/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blue_collar_cupid_app/MVC/view/loginScreen/SignInScreen.dart';
import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../helper/data_storage.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    isloggedcheck();
  }

  Future<void> _requestLocationPermission() async {
    // Check if permission is already granted
    if (await Permission.location.isGranted) {
      // Permission is already granted
      print("Location permission is already granted");
    } else {
      // Request permission
      final status = await Permission.location.request();
      print("Permission status: $status");
      if (status == PermissionStatus.granted) {
        print("Location permission granted");
      } else if (status == PermissionStatus.denied) {
        print("Location permission denied");
      } else if (status == PermissionStatus.permanentlyDenied) {
        print("Location permission permanently denied");
        // Handle this case if needed
      } else {
        print("Location permission unknown");
        // Handle this case if needed
      }
    }
  }

  String? token;
  isloggedcheck() async {
    log('UserToken');
    SharedPreferences instance = await SharedPreferences.getInstance();

    token = instance.getString("token");
    log(token.toString());
    if (token != null) {
      var _pref = DataStroge();

      await _pref.getUserData();
    } else {
      print('no user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(initState: (state) async {
      await _requestLocationPermission();
    }, builder: (themecontroller) {
      return AnnotatedRegion(
        value: themecontroller.systemUiOverlayStyleForwelcomeScreen,
        child: Scaffold(
            body: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(
                      // color: Colors.amber,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/welocmebg.png",
                          ))),
                )),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: themecontroller.colorPrimaryBlue,
                  boxShadow: [
                    BoxShadow(
                      color: themecontroller.colorPrimaryBlue
                          .withOpacity(0.9), // Shadow color
                      offset: Offset(0, -5),
                      blurRadius: 60,
                      spreadRadius: 60,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundButton(
                      height: 45.sp,
                      title: 'Get started',
                      textColor: Colors.black.withOpacity(0.5),
                      onTap: () {
                        Navigation.getInstance.RightToLeft_PageNavigation(
                            context, SignInScreen());
                      },
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    RoundButton(
                      height: 45.sp,
                      backgroundColor: themecontroller.colorPrimaryBlue,
                      title: 'Use Mobile Number',
                      borderWidth: 1.sp,
                      textColor: Colors.white,
                      onTap: () {
                        Navigation.getInstance.RightToLeft_PageNavigation(
                            context, loginwithPhoneScreen());
                      },
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'By signing up you agree to our',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 10.sp,
                            ),
                          ),
                          TextSpan(
                            text: ' Terms',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' and\n',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 10.sp,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' we protect your personal data',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      );
    });
  }
}

//
