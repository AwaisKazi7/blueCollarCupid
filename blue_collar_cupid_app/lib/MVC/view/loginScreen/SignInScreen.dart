import 'package:blue_collar_cupid_app/MVC/view/loginScreen/UserRegisterationScreen.dart';
import 'package:blue_collar_cupid_app/MVC/view/loginScreen/forgetPasswordScreen.dart';
import 'package:blue_collar_cupid_app/MVC/view/loginScreen/loginWithPhoneScreen.dart';
import 'package:blue_collar_cupid_app/components/BottomNav.dart';
import 'package:blue_collar_cupid_app/components/logintextfield.dart';
import 'package:blue_collar_cupid_app/helper/getx_helper.dart';
import 'package:blue_collar_cupid_app/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blue_collar_cupid_app/components/custom_textfiled.dart';
import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:get/get.dart';
import '../../../components/round_button.dart';
import '../../../constant/flutter_toast.dart';
import '../../../helper/internet_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final internetController = Get.put(InternetController());
  final getxcontroller = Get.put(GetxControllersProvider());
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  RxBool showPassword = true.obs;
  final FocusNode _EmailFocusNode = FocusNode();
  final FocusNode _PasswordFocusNode = FocusNode();

  RxBool apihitting = false.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(
        initState: (state) {},
        builder: (themecontroller) {
          return AnnotatedRegion(
            value: themecontroller.systemUiOverlayStyleForwelcomeScreen,
            child: Scaffold(
              backgroundColor: themecontroller.backgoundcolor,
              resizeToAvoidBottomInset: true,
              body: Container(
                decoration: BoxDecoration(
                  color: themecontroller.backgoundcolor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20.sp,
                            ),
                            Container(
                              height: 150.sp,
                              width: 150.sp,
                              decoration: const BoxDecoration(

                                  // color: Colors.amber,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                        "assets/images/logo.png",
                                      ))),
                            ),
                          ],
                        )),
                    Expanded(
                      flex: 3,
                      child: Form(
                        key: _formkey,
                        child: Container(
                          decoration: BoxDecoration(
                            color: themecontroller.colorPrimaryBlue,
                            boxShadow: [
                              BoxShadow(
                                color: themecontroller.colorPrimaryBlue
                                    .withOpacity(0.9), // Shadow color
                                offset: Offset(0, 5),
                                blurRadius: 30,
                                spreadRadius: 0,
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.sp),
                                topRight: Radius.circular(20.sp)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.sp),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.sp,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Welcome Back!',
                                        softWrap: true,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white,
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Sign In to your account',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.sp,
                                  ),
                                  loginTextFieldWidget(
                                    enabled: true,
                                    label: '',
                                    controller: emailController,
                                    hintText: "Email address",
                                    inputType: TextInputType.emailAddress,
                                    focusNode: _EmailFocusNode,
                                    onchange: (value) {
                                      apihitting.value = false;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter an email address';
                                      }
                                      const emailPattern =
                                          r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$';
                                      if (!RegExp(emailPattern).hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  Obx(() => loginTextFieldWidget(
                                        enabled: true,
                                        label: '',
                                        controller: PasswordController,
                                        hintText: "Password",
                                        inputType: TextInputType.visiblePassword,
                                        obscureText: showPassword.value,
                                        focusNode: _PasswordFocusNode,
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
                                            showPassword.value =
                                                !showPassword.value;
                                          },
                                          child: Icon(
                                            showPassword.value
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                  SizedBox(height: 15.sp),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SpringWidget(
                                        onTap: () {
                                          Navigation.getInstance
                                              .RightToLeft_PageNavigation(context,
                                                  ForgetPasswordScreen());
                                        },
                                        child: Text(
                                          'Forget Password',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15.sp),
                                  Obx(() => RoundButton(
                                        gradient: false,
                                        margin: 0,
                                        backgroundColor: Colors.white,
                                        height: 45.sp,
                                        borderRadius: 10.sp,
                                        loading: apihitting.value,
                                        disabled: apihitting.value,
                                        title: 'Sign In',
                                        borderColor: Colors.white,
                                        borderWidth: 1.sp,
                                        iconColor: themecontroller.colorwhite,
                                        textColor: Colors.black.withOpacity(0.5),
                                        onTap: () async {
                                          await internetController
                                              .internetCheckerFun();
                              
                                          if (_formkey.currentState!.validate()) {
                                            if (internetController
                                                    .isInternetConnected.value ==
                                                true) {
                                              apihitting.value = true;
                                              // if (emailController.text ==
                                              //     'driver@gmail.com') {
                                              //   Navigation.getInstance
                                              //       .RightToLeft_PageNavigation(
                                              //           context, DriverHomeScreen());
                                              // } else {
                                              //   Navigation.getInstance
                                              //       .RightToLeft_PageNavigation(
                                              //           context, UserHomeScreen());
                                              // }
                                              // await AppService.getInstance.login(
                                              //     context,
                                              //     emailController.text,
                                              //     PasswordController.text);
                                              Navigation.getInstance
                                                  .pagePushAndReplaceNavigation(
                                                      context, BottomNavBar());
                                              apihitting.value = false;
                                            } else {
                                              FlutterToastDisplay.getInstance
                                                  .showToast(
                                                      "Please check your internet");
                                            }
                                          }
                                        },
                                      )),
                                  SizedBox(height: 20.sp),
                                  GestureDetector(
                                    onTap: () {
                                      Navigation.getInstance.screenNavigation(
                                          context, UserRegisterationScreen());
                                    },
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: TextStyle(
                                            color: themecontroller.textcolor
                                                .withOpacity(0.9),
                                            fontSize: 11.sp),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Don't have an account?",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          TextSpan(
                                            text: ' Sign Up',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.sp),
                                  Obx(() => RoundButton(
                                        gradient: false,
                                        margin: 0,
                                        backgroundColor:
                                            themecontroller.colorPrimaryBlue,
                                        height: 45.sp,
                                        borderRadius: 10.sp,
                                        loading: apihitting.value,
                                        disabled: apihitting.value,
                                        title: 'Continue with Apple',
                                        borderColor: Colors.white,
                                        borderWidth: 1.sp,
                                        iconColor: themecontroller.colorwhite,
                                        textColor: themecontroller.colorwhite,
                                        onTap: () async {
                                          await internetController
                                              .internetCheckerFun();
                              
                                          if (internetController
                                                  .isInternetConnected.value ==
                                              true) {
                                            apihitting.value = true;
                                            // if (emailController.text ==
                                            //     'driver@gmail.com') {
                                            //   Navigation.getInstance
                                            //       .RightToLeft_PageNavigation(
                                            //           context, DriverHomeScreen());
                                            // } else {
                                            //   Navigation.getInstance
                                            //       .RightToLeft_PageNavigation(
                                            //           context, UserHomeScreen());
                                            // }
                                            // await AppService.getInstance.login(
                                            //     context,
                                            //     emailController.text,
                                            //     PasswordController.text);
                                            apihitting.value = false;
                                          } else {
                                            FlutterToastDisplay.getInstance
                                                .showToast(
                                                    "Please check your internet");
                                          }
                                        },
                                      )),
                                  SizedBox(
                                    height: 20.sp,
                                  ),
                                  Obx(() => RoundButton(
                                      gradient: false,
                                      margin: 0,
                                      backgroundColor:
                                          themecontroller.colorPrimaryBlue,
                                      height: 45.sp,
                                      borderRadius: 10.sp,
                                      loading: apihitting.value,
                                      disabled: apihitting.value,
                                      title: 'Continue with Google',
                                      borderColor: Colors.white,
                                      borderWidth: 1.sp,
                                      iconColor: themecontroller.colorwhite,
                                      textColor: themecontroller.colorwhite,
                                      onTap: () async {
                                        await internetController
                                            .internetCheckerFun();
                              
                                        if (internetController
                                                .isInternetConnected.value ==
                                            true) {
                                          apihitting.value = true;
                                          // if (emailController.text ==
                                          //     'driver@gmail.com') {
                                          //   Navigation.getInstance
                                          //       .RightToLeft_PageNavigation(
                                          //           context, DriverHomeScreen());
                                          // } else {
                                          //   Navigation.getInstance
                                          //       .RightToLeft_PageNavigation(
                                          //           context, UserHomeScreen());
                                          // }
                                          // await AppService.getInstance.login(
                                          //     context,
                                          //     emailController.text,
                                          //     PasswordController.text);
                                          apihitting.value = false;
                                        } else {
                                          FlutterToastDisplay.getInstance
                                              .showToast(
                                                  "Please check your internet");
                                        }
                                      })),
                                  SizedBox(
                                    height: 20.sp,
                                  ),
                                  Obx(() => RoundButton(
                                      gradient: false,
                                      margin: 0,
                                      backgroundColor:
                                          themecontroller.colorPrimaryBlue,
                                      height: 45.sp,
                                      borderRadius: 10.sp,
                                      loading: apihitting.value,
                                      disabled: apihitting.value,
                                      title: 'Continue with Phone Number',
                                      borderColor: Colors.white,
                                      borderWidth: 1.sp,
                                      iconColor: themecontroller.colorwhite,
                                      textColor: themecontroller.colorwhite,
                                      onTap: () async {
                                        await internetController
                                            .internetCheckerFun();
                              
                                        if (internetController
                                                .isInternetConnected.value ==
                                            true) {
                                          apihitting.value = true;
                                          // if (emailController.text ==
                                          //     'driver@gmail.com') {
                                          //   Navigation.getInstance
                                          //       .RightToLeft_PageNavigation(
                                          //           context, DriverHomeScreen());
                                          // } else {
                                          //   Navigation.getInstance
                                          //       .RightToLeft_PageNavigation(
                                          //           context, UserHomeScreen());
                                          // }
                                          // await AppService.getInstance.login(
                                          //     context,
                                          //     emailController.text,
                                          //     PasswordController.text);
                                          Navigation.getInstance
                                              .RightToLeft_PageNavigation(context,
                                                  loginwithPhoneScreen());
                                          apihitting.value = false;
                                        } else {
                                          FlutterToastDisplay.getInstance
                                              .showToast(
                                                  "Please check your internet");
                                        }
                                      })),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
