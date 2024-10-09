import 'package:blue_collar_cupid_app/MVC/view/Profile/profileSettingScreen.dart';
import 'package:blue_collar_cupid_app/MVC/view/commonScreens/chatScreen.dart';
import 'package:blue_collar_cupid_app/components/custom_textfiled.dart';
import 'package:blue_collar_cupid_app/components/image_widget.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/helper/getx_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../helper/internet_controller.dart';

class ConversationScreen extends StatelessWidget {
  ConversationScreen({super.key});
  final internetController = Get.put(InternetController());

  @override
  final SearchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  RxBool showbox = false.obs;
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Scaffold(
        backgroundColor: themecontroller.backgoundcolor,
        resizeToAvoidBottomInset: true,
        body: Container(
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(Constants.screenPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: themecontroller.colorPrimaryBlue,
                              radius: 27.sp,
                              child: CircleAvatar(
                                child: ClipOval(
                                  child: ImageWidget(
                                      boxfit: BoxFit.fill,
                                      width: 100.sp,
                                      imageUrl:
                                          'https://images.squarespace-cdn.com/content/v1/5446f93de4b0a3452dfaf5b0/1626904421257-T6I5V5IQ4GI2SJ8EU82M/Above+Avalon+Neil+Cybart'),
                                ),
                                radius: 25.sp,
                              ),
                            ),
                            Obx(
                              () => Visibility(
                                visible: showbox.value,
                                child: AnimatedOpacity(
                                  duration: Duration(milliseconds: 200),
                                  opacity: showbox.value ? 1.0 : 0.0,
                                  child: SizedBox(
                                    width: 270.sp,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 190.sp,
                                          child: CustomTextFieldWidget(
                                            enabled: true,
                                            label: 'search',
                                            controller: SearchController,
                                            hintText: "",
                                            inputType: TextInputType.name,
                                            icon: Icon(
                                              Icons.search,
                                              size: 20.sp,
                                              color: themecontroller
                                                  .colorPrimaryBlue,
                                            ),
                                            focusNode: _searchFocusNode,
                                            onsubmit: () {},
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your start point';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                        SpringWidget(
                                          onTap: () {
                                            showbox.value = !showbox.value;
                                          },
                                          child: CircleAvatar(
                                            radius: 20.sp,
                                            backgroundColor:
                                                Colors.grey.withOpacity(0.2),
                                            child: SvgPicture.asset(
                                              "assets/icons/cross.svg",
                                              height: 17.sp,
                                              width: 17.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => SpringWidget(
                                onTap: () {
                                  showbox.value = !showbox.value;
                                },
                                child: Visibility(
                                  visible: !showbox.value,
                                  child: AnimatedOpacity(
                                    duration: Duration(milliseconds: 200),
                                    opacity: !showbox.value ? 1.0 : 0.0,
                                    child: CircleAvatar(
                                      radius: 20.sp,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.2),
                                      child: SvgPicture.asset(
                                        "assets/icons/search.svg",
                                        height: 17.sp,
                                        width: 17.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Text(
                          'Chats',
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 4,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  primary: false,
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
              ),
            ],
          ),
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
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))),
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
              // Icon(
              //   Icons.arrow_forward_ios_rounded,
              //   color: themecontroller.colorPrimary,
              // )
            ],
          ),
        ),
      );
    });
  }
}
