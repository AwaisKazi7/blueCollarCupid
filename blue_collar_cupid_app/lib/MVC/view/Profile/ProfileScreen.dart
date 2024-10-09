import 'package:blue_collar_cupid_app/MVC/view/Profile/profileSettingScreen.dart';
import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/data/mockData.dart';
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
        value: themecontroller.systemUiOverlayStyleforwhiteandtarnsparent,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 300.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: themecontroller.colorPrimaryBlue,
                        borderRadius: BorderRadius.circular(30.sp)),
                  ),
                  Positioned(
                    bottom: 70.sp,
                    child: Container(
                      height: 120.sp,
                      width: 120.sp,
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.5)),
                      child: const ClipOval(
                        child: ImageWidget(
                            imageUrl:
                                'https://images.squarespace-cdn.com/content/v1/5446f93de4b0a3452dfaf5b0/1626904421257-T6I5V5IQ4GI2SJ8EU82M/Above+Avalon+Neil+Cybart'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30.sp,
                    child: Text(
                      'Michael James'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 15.sp,
                    child: Text(
                      'MichaelJames@gmail.com',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 30.sp,
                      left: 20.sp,
                      child: SpringWidget(
                        onTap: () {
                          Navigation.getInstance.RightToLeft_PageNavigation(
                              context, EditProfileScreen());
                        },
                        child: CircleAvatar(
                            radius: 20.sp,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 15.sp,
                            )),
                      )),
                  Positioned(
                      top: 30.sp,
                      right: 20.sp,
                      child: SpringWidget(
                        onTap: () {
                          Navigation.getInstance.RightToLeft_PageNavigation(
                              context, ProfileSettingScreen());
                        },
                        child: CircleAvatar(
                          radius: 20.sp,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            "assets/icons/threeDot.svg",
                            height: 15.sp,
                            width: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.screenPadding),
                child: Column(
                  children: [
                    Text(
                      'Bio',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    SizedBox(
                      width: 300.sp,
                      child: Text(
                        'Passionate UI/UX designer based in Morocco,\nspecializing in remote freelance work',
                        textAlign: TextAlign.center,
                        maxLines: 5,
                        softWrap: true,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Text(
                      'Your Profile gallery',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: MockData.matchCards[0].picture
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150.sp,
                                    width: 100.sp,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.sp))),
                                    alignment: Alignment.center,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.sp)),
                                      child: ImageWidget(
                                          height: 620.sp,
                                          width: double.infinity,
                                          imageUrl: e),
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
