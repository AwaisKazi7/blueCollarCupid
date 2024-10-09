import 'package:blue_collar_cupid_app/MVC/controller/homeController.dart';
import 'package:blue_collar_cupid_app/MVC/view/commonScreens/conversationScreen.dart';
import 'package:blue_collar_cupid_app/MVC/view/home/homeScreen.dart';
import 'package:blue_collar_cupid_app/MVC/view/home/nearbyscreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_cupid_app/MVC/view/Profile/ProfileScreen.dart';
import 'package:blue_collar_cupid_app/components/custom_appbar.dart';
import 'package:blue_collar_cupid_app/components/drawer.dart';
import 'package:get/get.dart';
import '../constant/theme.dart';

class BottomNavBar extends StatefulWidget {
  final int? initialIndex;
  BottomNavBar({this.initialIndex});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = widget.initialIndex ?? _currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(
        builder: (themeController) => AnnotatedRegion(
              value: themeController.systemUiOverlayStyleForwhite,
              child: Scaffold(
                extendBody: true,
                // appBar: _currentIndex != 0
                //     ? CustomAppBar(
                //         Title: _PageTitle(_currentIndex), showShop: false)
                //     : null,
                // drawer: AppDrawer(),
                body: _buildPage(_currentIndex),
                bottomNavigationBar: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 5),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                    ),
                    child: Material(
                      elevation: 0.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: BottomNavigationBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        currentIndex: _currentIndex,
                        selectedIconTheme: IconThemeData(
                            color: themeController.colorPrimaryBlue),
                        unselectedIconTheme: IconThemeData(
                          color: themeController.bottomiconcolor,
                        ),
                        selectedItemColor: themeController.colorPrimaryBlue,
                        unselectedItemColor: themeController.bottomiconcolor,
                        selectedLabelStyle: TextStyle(
                            color: themeController.colorPrimaryBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp),
                        unselectedLabelStyle: TextStyle(
                            color: themeController.bottomiconcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp),
                        onTap: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        type: BottomNavigationBarType.fixed,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _currentIndex == 0
                                  ? SvgPicture.asset(
                                      "assets/icons/home.svg",
                                      height: 17.sp,
                                      width: 17.sp,
                                      color: themeController.colorPrimaryBlue,
                                    )
                                  : SvgPicture.asset(
                                      "assets/icons/homeb.svg",
                                      height: 15.sp,
                                      width: 15.sp,
                                      color: themeController.colorPrimaryBlue,
                                    ),
                            ),
                            label: 'Home'.tr,
                          ),
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _currentIndex == 1
                                  ? SvgPicture.asset(
                                      "assets/icons/nearby.svg",
                                      height: 17.sp,
                                      width: 17.sp,
                                      color: themeController.colorPrimaryBlue,
                                    )
                                  : SvgPicture.asset(
                                      "assets/icons/nearby.svg",
                                      height: 15.sp,
                                      width: 15.sp,

                                      color: themeController.bottomiconcolor,
                                      // color: Theme.of(context).disabledColor,
                                    ),
                            ),
                            label: 'Nearby'.tr,
                          ),
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _currentIndex == 2
                                  ? SvgPicture.asset(
                                      "assets/icons/comment.svg",
                                      height: 17.sp,
                                      width: 17.sp,
                                      color: themeController.colorPrimaryBlue,
                                    )
                                  : SvgPicture.asset(
                                      "assets/icons/comment.svg",
                                      height: 15.sp,
                                      width: 15.sp,
                                      color: themeController.colorPrimaryBlue,
                                    ),
                            ),
                            label: 'Messages'.tr,
                          ),
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _currentIndex == 3
                                  ? SvgPicture.asset(
                                      "assets/icons/user.svg",
                                      height: 17.sp,
                                      width: 17.sp,
                                      color: themeController.colorPrimaryBlue,
                                    )
                                  : SvgPicture.asset(
                                      "assets/icons/userb.svg",
                                      height: 15.sp,
                                      width: 15.sp,
                                      color: themeController.colorPrimaryBlue,
                                    ),
                            ),
                            label: 'Profile'.tr,
                          ),
                        ],
                      ),
                    )),
              ),
            ));
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Homescreen();
      case 1:
        return Nearbyscreen();
      case 2:
        return ConversationScreen();
      case 3:
        return ProfileScreen();
      default:
        return Homescreen();
    }
  }

  String _PageTitle(int index) {
    switch (index) {
      case 0:
        return 'Explore';
      case 1:
        return 'Saerch';
      case 2:
        return 'Cart';
      case 3:
        return 'Profile';
      default:
        return 'Explore';
    }
  }
}
