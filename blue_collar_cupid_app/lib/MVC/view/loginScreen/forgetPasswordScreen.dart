import 'package:blue_collar_cupid_app/MVC/model/userModel.dart';
import 'package:blue_collar_cupid_app/MVC/view/loginScreen/otpVerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blue_collar_cupid_app/MVC/view/loginScreen/SignInScreen.dart';
import 'package:blue_collar_cupid_app/components/custom_textfiled.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:blue_collar_cupid_app/helper/data_storage.dart';
import 'package:blue_collar_cupid_app/helper/getx_helper.dart';
import 'package:blue_collar_cupid_app/services/app_service.dart';
import '../../../components/round_button.dart';
import '../../../constant/flutter_toast.dart';
import '../../../helper/internet_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final internetController = Get.put(InternetController());
  final getxcontroller = Get.put(GetxControllersProvider());
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();

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
              centerTitle: true,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              title: Text(
                'Forget Password',
                style: TextStyle(
                    color: themecontroller.colorPrimaryBlue,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
              )),
          body: Container(
            height: 650.sp,
            decoration: BoxDecoration(
                color: themecontroller.backgoundcolor,
                boxShadow: [
                  BoxShadow(
                    color: themecontroller.backgoundcolor.withOpacity(0.4),
                    spreadRadius: 9.5,
                    blurRadius: 40,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    topRight: Radius.circular(10.sp))),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.screenPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          height: 250.sp,
                          width: 250.sp,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/changePass.png'))),
                        ),
                        CustomTextFieldWidget(
                          enabled: true,
                          label: 'Enter email Address',
                          controller: emailController,
                          hintText: "",
                          suffixIcon: Icon(
                            Icons.email_outlined,
                            size: 20.sp,
                            color: Colors.grey.withOpacity(0.6),
                          ),
                          inputType: TextInputType.emailAddress,
                          focusNode: _emailFocusNode,
                          onsubmit: () {},
                          onchange: (value) {
                            apihitting.value = false;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email Address';
                            }
                            const emailPattern =
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$';
                            if (!RegExp(emailPattern).hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                          },
                        ),
                        SizedBox(height: 25.sp),
                        Obx(() => RoundButton(
                              gradient: false,
                              margin: 0,
                              backgroundColor: themecontroller.colorPrimaryBlue,
                              height: 45.sp,
                              loading: apihitting.value,
                              disabled: apihitting.value,
                              borderRadius: 10.sp,
                              title: 'verify OTP',
                              iconColor: themecontroller.colorwhite,
                              textColor: themecontroller.colorwhite,
                              onTap: () async {
                                await internetController.internetCheckerFun();

                                if (_formkey.currentState!.validate()) {
                                  if (internetController
                                          .isInternetConnected.value ==
                                      true) {
                                    apihitting.value = true;

                                    var flag;
                                    //= await AppService.getInstance
                                    //     .ResendOtp(
                                    //         context, emailController.text);

                                    if (flag) {
                                      Navigation.getInstance
                                          .RightToLeft_PageNavigation(
                                              context,
                                              otpVerificationScreen(
                                                email: emailController.text,
                                                authid:
                                                    11, //----it is just a dummy number
                                                type: 'forgetpassword',
                                              ));
                                    } else {}
                                    apihitting.value = false;
                                  } else {
                                    FlutterToastDisplay.getInstance.showToast(
                                        "Please check your internet");
                                  }
                                }
                              },
                            )),
                        SizedBox(height: 10.sp),
                        SizedBox(
                          height: 10.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
