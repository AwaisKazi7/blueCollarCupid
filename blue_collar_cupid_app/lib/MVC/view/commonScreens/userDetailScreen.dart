import 'package:blue_collar_cupid_app/MVC/model/cardModel.dart';
import 'package:blue_collar_cupid_app/MVC/view/commonScreens/chatScreen.dart';
import 'package:blue_collar_cupid_app/components/image_widget.dart';
import 'package:blue_collar_cupid_app/components/round_button.dart';
import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:get/get.dart';
import '../../../helper/internet_controller.dart';

class UserDetailScreen extends StatelessWidget {
  UserDetailScreen({
    super.key,
    required this.data,
  });
  final MatchCard data;
  final internetController = Get.put(InternetController());

  @override
  RxBool showmessageBox = false.obs;
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
        value: themecontroller.systemUiOverlayStyleforwhiteandtarnsparent,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 600.sp,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListWheelScrollViewX(
                              itemExtent: 400.sp,
                              scrollDirection: Axis.horizontal,
                              children: data.picture
                                  .map(
                                    (e) => Hero(
                                      tag: 'product-image${data.id}',
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 600.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.sp)),
                                            width: double.infinity,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.sp),
                                              child: ImageWidget(imageUrl: e),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10.sp,
                                            right: 30.sp,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.sp)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.image_outlined,
                                                      size: 15.sp,
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                    ),
                                                    Text(
                                                      data.picture.length
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 8.sp,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.4)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 30.sp,
                        left: 20.sp,
                        child: SpringWidget(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.arrow_back),
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constants.screenPadding),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.sp,
                      ),
                      SizedBox(
                        width: 300.sp,
                        child: Text(
                          textAlign: TextAlign.center,
                          data.name,
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      SizedBox(
                        width: 300.sp,
                        child: Text(
                          data.address,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Obx(
                        () => Visibility(
                          visible: showmessageBox.value == false,
                          replacement: RoundButton(
                            height: 45.sp,
                            borderRadius: 30.sp,
                            backgroundColor: themecontroller.colorPrimaryBlue,
                            title: 'start Chatting',
                            borderWidth: 1.sp,
                            textColor: Colors.white,
                            onTap: () {
                              Navigation.getInstance.RightToLeft_PageNavigation(
                                  context,
                                  ChatScreen(
                                    image: data.picture[0],
                                    name: data.name,
                                  ));
                            },
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    themecontroller.colorPrimaryBlue,
                                radius: 30.sp,
                                child: SvgPicture.asset(
                                  "assets/icons/cross.svg",
                                  height: 20.sp,
                                  width: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 20.sp,
                              ),
                              SpringWidget(
                                onTap: () {
                                  showmessageBox.value = true;
                                },
                                child: CircleAvatar(
                                  backgroundColor: HexColor('#F63C4E'),
                                  radius: 30.sp,
                                  child: SvgPicture.asset(
                                    "assets/icons/Likefill.svg",
                                    height: 20.sp,
                                    width: 20.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
