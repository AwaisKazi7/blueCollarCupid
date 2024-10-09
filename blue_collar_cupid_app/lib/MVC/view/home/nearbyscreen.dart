import 'package:blue_collar_cupid_app/MVC/view/commonScreens/userDetailScreen.dart';
import 'package:blue_collar_cupid_app/components/nearbycard.dart';
import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/components/tindercard.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:blue_collar_cupid_app/data/mockData.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Nearbyscreen extends StatelessWidget {
  const Nearbyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
        value: themecontroller.systemUiOverlayStyleForwhite,
        child: Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.white,
              title: Text('Nearby'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Constants.screenPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 10.sp,
                        crossAxisSpacing: 10.sp,
                      ),
                      itemCount: MockData.matchCards.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SpringWidget(
                            onTap: () {
                              Navigation.getInstance.bottomToTop_PageNavigation(
                                  context,
                                  UserDetailScreen(
                                      data: MockData.matchCards[index]));
                            },
                            child:
                                NearBycard(data: MockData.matchCards[index]));
                      },
                    )
                  ],
                ),
              ),
            )),
      );
    });
  }
}
