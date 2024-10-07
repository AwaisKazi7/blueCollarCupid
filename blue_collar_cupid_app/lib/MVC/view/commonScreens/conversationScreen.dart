import 'package:blue_collar_cupid_app/MVC/view/Profile/profileSettingScreen.dart';
import 'package:blue_collar_cupid_app/MVC/view/commonScreens/chatScreen.dart';
import 'package:blue_collar_cupid_app/components/image_widget.dart';
import 'package:blue_collar_cupid_app/helper/getx_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:get/get.dart';
import '../../../helper/internet_controller.dart';

class ConversationScreen extends StatelessWidget {
  ConversationScreen({super.key});
  final internetController = Get.put(InternetController());
  final getxcontroller = Get.put(GetxControllersProvider());

  final fearController = TextEditingController();
  final FocusNode _fearFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Messages',
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: themecontroller.colorPrimary),
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          primary: true,
          itemBuilder: (BuildContext context, int index) {
            return SpringWidget(
                onTap: () {
                  Navigation.getInstance.RightToLeft_PageNavigation(
                      context,
                      ChatScreen(
                          image:
                              'https://images.squarespace-cdn.com/content/v1/5e6ece70bd2f8a6de8472818/714f685e-d0ba-40f9-8bb2-38722c1fd29c/Tiny+Avatar.png',
                          name: 'john william'));
                },
                child: chatCard());
          },
        ),
      );
    });
  }
}

class chatCard extends StatelessWidget {
  const chatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10.sp),
            boxShadow: [
              BoxShadow(
                color: themecontroller.colorPrimaryBlue.withOpacity(0.2),
                spreadRadius: 1.5,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.sp,
                            child: ClipOval(
                              child: ImageWidget(
                                  imageUrl:
                                      'https://images.squarespace-cdn.com/content/v1/5e6ece70bd2f8a6de8472818/714f685e-d0ba-40f9-8bb2-38722c1fd29c/Tiny+Avatar.png'),
                            ),
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'john william',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                ' hello',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: themecontroller.colorPrimary,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
