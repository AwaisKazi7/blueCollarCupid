import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blue_collar_cupid_app/components/OtpfieldWidget.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:get/get.dart';
import '../../../components/round_button.dart';
import '../../../helper/internet_controller.dart';

class otpVerificationScreen extends StatelessWidget {
  otpVerificationScreen(
      {super.key,
      required this.email,
      required this.authid,
      required this.type});
  final String email;
  final int authid;
  final String type;
  final internetController = Get.put(InternetController());

  final _formkey = GlobalKey<FormState>();

  final otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();
  RxBool apihitting = false.obs;
  RxBool ResendOtploading = false.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
        value: themecontroller.systemUiOverlayStyleForwhite,
        child: Scaffold(
          backgroundColor: themecontroller.backgoundcolor,
          // backgroundColor: Colors.black,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: themecontroller.backgoundcolor,
              centerTitle: true,
              title: Text(
                'OTP',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              )),
          body: Container(
            child: Column(
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        'OTP Verification',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Text(
                      'Please enter OTP code sent to \nyour email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                  ],
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OtpfieldWidget(otpController: otpController),
                      SizedBox(
                        height: 15.sp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't receive a code? ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Obx(
                              () => ResendOtploading.value
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.sp),
                                      child: SizedBox(
                                          width: 15.sp,
                                          child: CircularProgressIndicator(
                                            color: themecontroller.colorPrimary,
                                          )),
                                    )
                                  : SpringWidget(
                                      onTap: () async {
                                        ResendOtploading.value = true;
                                        // await AppService.getInstance
                                        //     .ResendOtp(context, email);
                                        ResendOtploading.value = false;
                                      },
                                      child: Text(
                                        'RESEND OTP',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: themecontroller.colorPrimary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 45.sp,
            padding: EdgeInsets.symmetric(horizontal: Constants.screenPadding),
            child: Obx(() => RoundButton(
                  gradient: false,
                  margin: 0,
                  backgroundColor: themecontroller.colorPrimary,
                  height: 60.sp,
                  loading: apihitting.value,
                  disabled: apihitting.value,
                  title: 'verify OTP',
                  iconColor: themecontroller.colorwhite,
                  textColor: themecontroller.colorwhite,
                  onTap: () async {
                    await internetController.internetCheckerFun();

                    if (_formkey.currentState!.validate()) {
                      apihitting.value = true;
                      if (type == 'forgetpassword') {
                        // await AppService.getInstance
                        //     .forgetPassword(context, otpController.text, email);
                      } else {
                        // await AppService.getInstance.checkOtp(
                        //     context, otpController.text, authid, type);
                      }
                      apihitting.value = false;
                    }
                  },
                )),
          ),
        ),
      );
    });
  }
}
