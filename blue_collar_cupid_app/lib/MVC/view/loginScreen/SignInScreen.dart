import 'package:blue_collar_cupid_app/MVC/view/loginScreen/UserRegisterationScreen.dart';
import 'package:blue_collar_cupid_app/MVC/view/loginScreen/forgetPasswordScreen.dart';
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
            value: themecontroller.systemUiOverlayStyleForwhite,
            child: Scaffold(
              backgroundColor: themecontroller.backgoundcolor,
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                  centerTitle: true,
                  surfaceTintColor: Colors.white,
                  backgroundColor: Colors.white,
                  title: Text(
                    'Sign In',
                    style: TextStyle(
                        color: themecontroller.colorPrimaryBlue,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  )),
              body: Container(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.screenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.sp,
                          ),
                          Column(
                            children: [
                              SpringWidget(
                                onTap: () {},
                                child: Image.asset(
                                  "assets/images/logo2.png",
                                  // height: 200.sp,
                                  // width: 200.sp,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Please Sign in to continue',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                CustomTextFieldWidget(
                                  enabled: true,
                                  label: 'Email address',
                                  controller: emailController,
                                  hintText: "",
                                  inputType: TextInputType.emailAddress,
                                  focusNode: _EmailFocusNode,
                                  onsubmit: () {},
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
                                Obx(() => CustomTextFieldWidget(
                                      enabled: true,
                                      label: 'Password',
                                      controller: PasswordController,
                                      hintText: "",
                                      inputType: TextInputType.visiblePassword,
                                      obscureText: showPassword.value,
                                      focusNode: _PasswordFocusNode,
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
                                          showPassword.value =
                                              !showPassword.value;
                                        },
                                        child: Icon(
                                          showPassword.value
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: themecontroller.textcolor
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 10.sp),
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
                                            color: themecontroller
                                                .colorPrimaryBlue,
                                            fontSize: 10.sp),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10.sp),
                                Obx(() => RoundButton(
                                      gradient: false,
                                      margin: 0,
                                      backgroundColor:
                                          themecontroller.colorPrimaryBlue,
                                      height: 45.sp,
                                      borderRadius: 10.sp,
                                      loading: apihitting.value,
                                      disabled: apihitting.value,
                                      title: 'Sign In',
                                      iconColor: themecontroller.colorwhite,
                                      textColor: themecontroller.colorwhite,
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
                                              color:
                                                  Colors.grey.withOpacity(0.7)),
                                        ),
                                        TextSpan(
                                          text: ' SIGN UP',
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  themecontroller.colorPrimary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.sp),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Constants.screenPadding),
                  ],
                ),
              ),
              bottomNavigationBar: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.sp, vertical: 20.sp),
                child: RoundButton(
                  gradient: false,
                  width: 200.sp,
                  margin: 0,
                  backgroundColor: themecontroller.colorPrimary,
                  height: 35.sp,
                  borderRadius: 30.sp,
                  title: 'Become a Driver',
                  icon: Icons.car_rental_sharp,
                  iconColor: themecontroller.colorwhite,
                  textColor: themecontroller.colorwhite,
                  onTap: () async {},
                ),
              ),
            ),
          );
        });
  }
}
