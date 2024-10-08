import 'package:flutter/material.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:get/get.dart';

class Nearbyscreen extends StatelessWidget {
  const Nearbyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
        value: themecontroller.systemUiOverlayStyleForwhite,
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Near by screen")],
        )),
      );
    });
  }
}
