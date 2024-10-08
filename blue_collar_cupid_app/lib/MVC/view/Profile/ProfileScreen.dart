import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:blue_collar_cupid_app/MVC/view/Profile/changePasswordScreen.dart';
import 'package:blue_collar_cupid_app/MVC/view/Profile/editProfileScreen.dart';
import 'package:blue_collar_cupid_app/components/custom_textfiled.dart';
import 'package:blue_collar_cupid_app/components/image_widget.dart';
import 'package:blue_collar_cupid_app/components/round_button.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:get/get.dart';
import '../../../helper/internet_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final internetController = Get.put(InternetController());
  final ShareController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
        value: themecontroller.systemUiOverlayStyleForwhite,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.screenPadding),
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 50.sp,
                  ),
                  Center(
                    child: Container(
                      height: 150.sp,
                      width: 150.sp,
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themecontroller.greenheadingColor
                              .withOpacity(0.2)),
                      child: ClipOval(
                        child: ImageWidget(
                            imageUrl:
                                'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'),
                      ),
                    ),
                  ),
                  Text(
                    'salman lodhi'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Container(
                    height: 350.sp,
                    width: 280.sp,
                    decoration: BoxDecoration(
                      color: themecontroller.backgoundcolor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1.5,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Constants.screenPadding,
                          vertical: Constants.screenPadding),
                      child: Column(children: [
                        Profiletabs(
                          icons: Icons.person,
                          text: 'Edit Profile',
                          ontap: () {
                            Navigation.getInstance
                                .screenNavigation(context, EditProfileScreen());
                          },
                        ),
                        Profiletabs(
                          icons: Icons.password,
                          text: 'Change Password',
                          ontap: () {
                            Navigation.getInstance.screenNavigation(
                                context, ChangePsswordScreen());
                          },
                        ),
                        Profiletabs(
                          icons: Icons.list,
                          text: 'My Ordered Services',
                          ontap: () {},
                        ),
                        Profiletabs(
                          icons: Icons.list,
                          text: 'My Order list',
                          ontap: () {},
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class Profiletabs extends StatelessWidget {
  const Profiletabs({
    super.key,
    required this.icons,
    required this.text,
    this.ontap,
  });
  final IconData icons;
  final String text;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(
      builder: (themecontroller) {
        return ListTile(
          leading: Icon(
            icons,
            color: themecontroller.colorPrimary,
          ),
          title: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 13.sp),
          ),
          onTap: ontap,
        );
      },
    );
  }
}
