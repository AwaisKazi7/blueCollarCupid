import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:blue_collar_cupid_app/components/custom_textfiled.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:blue_collar_cupid_app/services/app_service.dart';
import 'package:get/get.dart';
import '../../../components/round_button.dart';
import '../../../helper/internet_controller.dart';

class SetNewPasswordScreen extends StatelessWidget {
  SetNewPasswordScreen({super.key, required this.email});
  final String email;
  final internetController = Get.put(InternetController());

  final _formkey = GlobalKey<FormState>();

  final ConfirmPasswordController = TextEditingController();
  final PasswordController = TextEditingController();
  final FocusNode _ConfirmpasswordFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  RxBool showpassword = true.obs;
  RxBool showConfirmpassword = true.obs;
  RxBool apihitting = false.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
        value: themecontroller.systemUiOverlayStyleForwhite,
        child: Scaffold(
          backgroundColor: themecontroller.backgoundcolor,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: themecontroller.backgoundcolor,
              centerTitle: true,
              // title: Text(
              //   'Set New Password',
              //   style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              // )
              ),
          body: Container(
            height: 550.sp,
            decoration: BoxDecoration(
              color: themecontroller.backgoundcolor,
              // boxShadow: [
              //   BoxShadow(
              //     color: themecontroller.backgoundcolor.withOpacity(0.4),
              //     spreadRadius: 9.5,
              //     blurRadius: 40,
              //     offset: const Offset(0, 2), // changes position of shadow
              //   ),
              // ],
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(10.sp),
              //     topRight: Radius.circular(10.sp))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Constants.screenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.sp,
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Set New Password',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Setup your new password so you can Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Form(
                            key: _formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(() => CustomTextFieldWidget(
                                      enabled: true,
                                      label: 'Enter New Password',
                                      controller: ConfirmPasswordController,
                                      hintText: "Enter password",
                                      inputType: TextInputType.visiblePassword,
                                      obscureText: showConfirmpassword.value,
                                      focusNode: _ConfirmpasswordFocusNode,
                                      onsubmit: () {},
                                      onchange: (value) {
                                        apihitting.value = false;
                                      },
                                      validator: (input) => input!.length < 3
                                          ? 'Please enter at least 3 characters'
                                          : input.length > 20
                                              ? 'Please enter only 20 characters'
                                              : null,
                                      suffixIcon: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          showConfirmpassword.value =
                                              !showConfirmpassword.value;
                                        },
                                        child: Icon(
                                          showConfirmpassword.value
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: themecontroller.textcolor
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    )),
                                Obx(() => CustomTextFieldWidget(
                                      enabled: true,
                                      label: 'Re-type Password',
                                      controller: PasswordController,
                                      hintText: "Re-type Password",
                                      inputType: TextInputType.visiblePassword,
                                      obscureText: showpassword.value,
                                      focusNode: _passwordFocusNode,
                                      onsubmit: () {},
                                      onchange: (value) {
                                        apihitting.value = false;
                                      },
                                      validator: (input) => input!.length < 3
                                          ? 'Please enter at least 3 characters'
                                          : input.length > 20
                                              ? 'Please enter only 20 characters'
                                              : null,
                                      suffixIcon: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          showpassword.value =
                                              !showpassword.value;
                                        },
                                        child: Icon(
                                          showpassword.value
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: themecontroller.textcolor
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 30.sp),
                                Obx(() => RoundButton(
                                      gradient: false,
                                      margin: 0,
                                      backgroundColor:
                                          themecontroller.colorPrimary,
                                      height: 60.sp,
                                      loading: apihitting.value,
                                      disabled: apihitting.value,
                                      title: 'Change Password',
                                      iconColor: themecontroller.colorwhite,
                                      textColor: themecontroller.colorwhite,
                                      onTap: () async {
                                        await internetController
                                            .internetCheckerFun();

                                        if (_formkey.currentState!.validate()) {
                                          // if (internetController
                                          //         .isInternetConnected.value ==
                                          //     true) {
                                          if (PasswordController.text ==
                                              ConfirmPasswordController.text) {
                                            apihitting.value = true;

                                            // await AppService.getInstance
                                            //     .SetNewPassword(
                                            //         context,
                                            //         PasswordController.text,
                                            //         email);
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Password Doesn't match");
                                          }
                                        }
                                      },
                                    )),
                                // SizedBox(height: 20.sp),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(height: Constants.screenPadding),
              ],
            ),
          ),
        ),
      );
    });
  }
}
