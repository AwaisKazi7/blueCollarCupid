import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blue_collar_cupid_app/MVC/view/loginScreen/SignInScreen.dart';
import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:get/get.dart';
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
      return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: Constants.screenPadding),
          decoration: BoxDecoration(color: themecontroller.backgoundcolor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // "assets/images/titleLogo.png",
              Expanded(flex: 2, child: SizedBox(height: 30.sp)),
              Container(
                height: 500.sp,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          "assets/images/logo.png",
                        ))),
              ),
              Expanded(flex: 1, child: SizedBox(height: 30.sp)),

              SpringWidget(
                  onTap: () async {
                    if (DataStroge.userToken.value == '') {
                      Navigation.getInstance.pagePushAndReplaceNavigation(
                          context, SignInScreen());
                    } else if (DataStroge.userRole.value == 'USER') {
                    } else {}
                  },
                  child: CircleAvatar()),
              Expanded(flex: 4, child: SizedBox(height: 30.sp)),
            ],
          ),
        ),
      );
    });
  }
}

//
