import 'dart:io';
import 'package:blue_collar_cupid_app/MVC/view/Profile/editProfileScreen.dart';
import 'package:blue_collar_cupid_app/MVC/view/commonScreens/FAQScreen.dart';
import 'package:blue_collar_cupid_app/MVC/view/loginScreen/SignInScreen.dart';
import 'package:blue_collar_cupid_app/components/image_widget.dart';
import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:blue_collar_cupid_app/helper/data_storage.dart';
import 'package:blue_collar_cupid_app/helper/getx_helper.dart';
import 'package:blue_collar_cupid_app/helper/internet_controller.dart';
import 'package:blue_collar_cupid_app/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileSettingScreen extends StatelessWidget {
  ProfileSettingScreen({super.key});

  final internetController = Get.put(InternetController());
  final getcontroller = Get.put(GetxControllersProvider());
  File? selectedImage;
  final naamecontroller = TextEditingController();
  final Biocontroller = TextEditingController();
  final Phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  RxBool apihitting = false.obs;
  RxBool switchingRole = false.obs;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
          value: themecontroller.systemUiOverlayStyleForwhite,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: themecontroller.backgoundcolor,
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                  backgroundColor: themecontroller.backgoundcolor,
                  title: Text(
                    'Settings',
                    style: TextStyle(
                        color: themecontroller.colorPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.sp),
                  )),
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.screenPadding,
                    vertical: Constants.screenPadding),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SpringWidget(
                        onTap: () {
                          Navigation.getInstance.RightToLeft_PageNavigation(
                              context, EditProfileScreen());
                        },
                        child: Obx(
                          () => Row(
                            children: [
                              CircleAvatar(
                                radius: 30.sp,
                                child: ClipOval(
                                  child: ImageWidget(
                                      imageUrl:
                                          'https://images.squarespace-cdn.com/content/v1/5e6ece70bd2f8a6de8472818/714f685e-d0ba-40f9-8bb2-38722c1fd29c/Tiny+Avatar.png'),
                                ),
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DataStroge.FullName.value,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                        color: themecontroller.colorPrimary,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      // ListTile(
                      //   title: Text(
                      //     'Change Password',
                      //     style: TextStyle(
                      //         color: Colors.black, fontWeight: FontWeight.w700),
                      //   ),
                      //   onTap: () async {
                      //     Navigation.getInstance.RightToLeft_PageNavigation(
                      //         context, ChangePsswordScreen());
                      //   },
                      // ),
                      ListTile(
                        title: Text(
                          'My trips',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        onTap: () async {
                          
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Payments',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        onTap: () async {
                          
                        },
                      ),
                      Visibility(
                        visible: DataStroge.userRole.value == 'DRIVER',
                        child: ListTile(
                          title: Text(
                            'Add Bank Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          onTap: () async {
                            
                          },
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: DataStroge.DVS.value == 'FALSE',
                          replacement: ListTile(
                            title: Visibility(
                              visible: DataStroge.userRole.value == 'USER',
                              child: Text(
                                "Switch to Driver Mode",
                                style: TextStyle(
                                    color: themecontroller.colorPrimary,
                                    fontWeight: FontWeight.w700),
                              ),
                              replacement: Text(
                                "Switch to User Mode",
                                style: TextStyle(
                                    color: themecontroller.colorPrimary,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            trailing: Visibility(
                              visible: switchingRole.value,
                              child: SizedBox(
                                  width: 15.sp,
                                  height: 15.sp,
                                  child: CircularProgressIndicator(
                                    color: themecontroller.colorPrimary,
                                  )),
                            ),
                            onTap: () async {
                              switchingRole.value = true;
                              // await AppService.getInstance.switchRole(context);
                              switchingRole.value = false;
                              Navigation.getInstance
                                  .pagePushAndReplaceNavigation(
                                      context, SignInScreen());
                            },
                          ),
                          child: ListTile(
                            title: Text(
                              "Become A Driver",
                              style: TextStyle(
                                  color: themecontroller.colorPrimary,
                                  fontWeight: FontWeight.w700),
                            ),
                            onTap: () async {
                            
                            },
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "FAQ's",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        onTap: () async {
                          Navigation.getInstance
                              .RightToLeft_PageNavigation(context, FAQScreen());
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Safety",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        onTap: () async {
                          // Navigation.getInstance
                          //     .RightToLeft_PageNavigation(
                          //         context, SavedPostScreen());
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w700),
                        ),
                        onTap: () async {
                          final pref = DataStroge();
                          await pref.logout();
                          Navigation.getInstance.pagePushAndReplaceNavigation(
                              context, SignInScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
