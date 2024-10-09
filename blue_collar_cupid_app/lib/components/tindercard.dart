import 'package:blue_collar_cupid_app/MVC/model/cardModel.dart';
import 'package:blue_collar_cupid_app/components/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class tindercard extends StatelessWidget {
  const tindercard({
    super.key,
    required this.data,
  });
  final MatchCard data;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Stack(
        children: [
          Container(
            height: 550.sp,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.sp))),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.sp)),
              child: ImageWidget(
                  height: 620.sp,
                  width: double.infinity,
                  imageUrl: data.picture[0]),
            ),
          ),
          Container(
            height: 550.sp,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(198, 0, 0, 0),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.sp))),
          ),
          Positioned(
              bottom: 100.sp,
              left: 20.sp,
              child: Text(
                data.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
              bottom: 90.sp,
              left: 20.sp,
              child: Text(
                data.address,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
            bottom: 20.sp,
            left: 90.sp,
            child: CircleAvatar(
              backgroundColor: themecontroller.colorPrimaryBlue,
              radius: 30.sp,
              child: SvgPicture.asset(
                "assets/icons/cross.svg",
                height: 20.sp,
                width: 20.sp,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 20.sp,
            right: 90.sp,
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
      );
    });
  }
}
