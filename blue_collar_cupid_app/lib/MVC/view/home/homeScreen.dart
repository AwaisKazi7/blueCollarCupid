import 'package:blue_collar_cupid_app/MVC/model/cardModel.dart';
import 'package:blue_collar_cupid_app/components/image_widget.dart';
import 'package:blue_collar_cupid_app/components/tindercard.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/data/mockData.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:hexcolor/hexcolor.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
        value: themecontroller.systemUiOverlayStyleForwhite,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 50.sp,
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.screenPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                        SizedBox(
                          width: 5.sp,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hello,Jennifer'),
                            Text(
                              'Let’s find a match',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.sp),
                            )
                          ],
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 20.sp,
                      backgroundColor:
                          themecontroller.colorPrimaryBlue.withOpacity(0.8),
                      child: SvgPicture.asset(
                        "assets/icons/bell.svg",
                        height: 17.sp,
                        width: 17.sp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: CardSwiper(
                  numberOfCardsDisplayed: 3,
                  cardsCount: MockData.matchCards.length,
                  cardBuilder:
                      (context, index, percentThresholdX, percentThresholdY) =>
                          tindercard(
                    data: MockData.matchCards[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
