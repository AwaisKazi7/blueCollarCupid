import 'package:blue_collar_cupid_app/MVC/model/cardModel.dart';
import 'package:blue_collar_cupid_app/components/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class NearBycard extends StatelessWidget {
  const NearBycard({
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
              child: Hero(
                tag: 'product-image${data.id}',
                child: ImageWidget(
                    height: 620.sp,
                    width: double.infinity,
                    imageUrl: data.picture[0]),
              ),
            ),
          ),
          Container(
            height: 550.sp,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    themecontroller.colorPrimaryBlue.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.sp))),
          ),
          Positioned(
              bottom: 60.sp,
              left: 10.sp,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 1.sp, vertical: 1.sp),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1.sp,
                    ),
                    borderRadius: BorderRadius.circular(20.sp)),
                child: SizedBox(
                  width: 60.sp,
                  child: Text(
                    '5 km away',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontSize: 7.sp,
                    ),
                  ),
                ),
              )),
          Positioned(
              bottom: 30.sp,
              left: 10.sp,
              child: SizedBox(
                width: 150.sp,
                child: Text(
                  data.name,
                  softWrap: true,
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Positioned(
              bottom: 10.sp,
              left: 10.sp,
              child: SizedBox(
                width: 150.sp,
                child: Text(
                  data.address,
                  softWrap: true,
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: 9.sp,
                  ),
                ),
              )),
        ],
      );
    });
  }
}
