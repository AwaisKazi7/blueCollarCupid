import 'package:blue_collar_cupid_app/MVC/model/userModel.dart';
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

class UserRegisterationScreen extends StatelessWidget {
  UserRegisterationScreen({super.key});

  final internetController = Get.put(InternetController());
  final getxcontroller = Get.put(GetxControllersProvider());
  final _formkey = GlobalKey<FormState>();

  // final loactionController = TextEditingController();

  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final citynamecontroller = TextEditingController();
  final Phonecontroller = TextEditingController();
  final SSNcontroller = TextEditingController();

  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _fullnameFocusNode = FocusNode();
  final FocusNode _ConfirmPasswordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _SSNFocusNode = FocusNode();

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
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
              centerTitle: true,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              title: Text(
                'Create User Account',
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.sp,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create User Account',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.grey.withOpacity(0.7),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          CustomTextFieldWidget(
                            enabled: true,
                            label: 'Full Name',
                            controller: fullnameController,
                            hintText: "",
                            suffixIcon: Icon(
                              Icons.person,
                              size: 20.sp,
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            inputType: TextInputType.name,
                            focusNode: _fullnameFocusNode,
                            onsubmit: () {},
                            onchange: (value) {
                              apihitting.value = false;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Full Name';
                              } else if (value.length > 25) {
                                return 'character limit: 25';
                              }
                              return null;
                              // const emailPattern =
                              //     r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$';
                              // if (!RegExp(emailPattern).hasMatch(value)) {
                              //   return 'Please enter a valid email address';
                              // }
                              return null;
                            },
                          ),
                          CustomTextFieldWidget(
                            enabled: true,
                            label: 'User Name',
                            controller: usernameController,
                            hintText: "",
                            inputType: TextInputType.name,
                            suffixIcon: Icon(
                              Icons.person,
                              size: 20.sp,
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            focusNode: _usernameFocusNode,
                            onsubmit: () {},
                            onchange: (value) {
                              apihitting.value = false;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter User Name';
                              } else if (value.length > 25) {
                                return 'Character Limit: 25';
                              }
                              return null;
                              // const emailPattern =
                              //     r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$';
                              // if (!RegExp(emailPattern).hasMatch(value)) {
                              //   return 'Please enter a valid email address';
                              // }
                            },
                          ),
                          CustomTextFieldWidget(
                            enabled: true,
                            label: 'Phone Number',
                            controller: Phonecontroller,
                            hintText: "",
                            inputType: TextInputType.phone,
                            suffixIcon: Icon(
                              Icons.person,
                              size: 20.sp,
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            focusNode: _phoneFocusNode,
                            onsubmit: () {},
                            onchange: (value) {
                              apihitting.value = false;
                            },
                            validator: (value) {
                              const String phoneNumberpattern =
                                  r'^(\+1\s?)?(\([0-9]{3}\)|[0-9]{3})[\s\.\-]?[0-9]{3}[\s\.\-]?[0-9]{4}$';

                              if (value == null || value.isEmpty) {
                                return 'Please Enter Phone Number';
                              } else if (!RegExp(phoneNumberpattern)
                                  .hasMatch(value)) {
                                return 'Please Enter a Valid Phone Number';
                              }
                              return null;
                            },
                          ),
                          CustomTextFieldWidget(
                            enabled: true,
                            label: 'Enter Email Address',
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
                          CustomTextFieldWidget(
                            enabled: true,
                            label: 'SSN',
                            controller: SSNcontroller,
                            hintText: "",
                            inputType: TextInputType.number,
                            suffixIcon: Icon(
                              Icons.person,
                              size: 20.sp,
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            focusNode: _SSNFocusNode,
                            onsubmit: () {},
                            onchange: (value) {
                              apihitting.value = false;
                            },
                            validator: (value) {
                              final String ssnPattern = r'^\d{3}-\d{2}-\d{4}$';

                              if (value == null || value.isEmpty) {
                                return 'Please Enter SSN';
                              } else if (!RegExp(ssnPattern).hasMatch(value)) {
                                return 'Please Enter a valid SSN (AAA-GG-SSSS)';
                              }

                              return null;
                            },
                          ),
                          Obx(() => CustomTextFieldWidget(
                                enabled: true,
                                label: 'Password',
                                controller: passwordController,
                                hintText: "",
                                inputType: TextInputType.visiblePassword,
                                obscureText: showConfirmpassword.value,
                                focusNode: _ConfirmPasswordFocusNode,
                                onsubmit: () {},
                                onchange: (value) {
                                  apihitting.value = false;
                                },
                                validator: (input) => input!.length < 8
                                    ? 'Please Enter At Least 8 Characters'
                                    : input.length > 20
                                        ? 'Please Enter Only 20 Characters'
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
                                label: 'Re-Type Password',
                                controller: confirmPasswordController,
                                hintText: "",
                                inputType: TextInputType.visiblePassword,
                                obscureText: showpassword.value,
                                focusNode: _passwordFocusNode,
                                onsubmit: () {},
                                onchange: (value) {
                                  apihitting.value = false;
                                },
                                validator: (input) => input!.length < 8
                                    ? 'Please Enter At Least 8 Characters'
                                    : input.length > 20
                                        ? 'Please Enter Only 20 Characters'
                                        : null,
                                suffixIcon: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    showpassword.value = !showpassword.value;
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
                          SizedBox(height: 12.sp),
                          Obx(() => RoundButton(
                                gradient: false,
                                margin: 0,
                                backgroundColor:
                                    themecontroller.colorPrimaryBlue,
                                height: 45.sp,
                                loading: apihitting.value,
                                disabled: apihitting.value,
                                borderRadius: 10.sp,
                                title: 'Submit',
                                iconColor: themecontroller.colorwhite,
                                textColor: themecontroller.colorwhite,
                                onTap: () async {
                                  // await internetController
                                  //     .internetCheckerFun();

                                  if (_formkey.currentState!.validate()) {
                                    if (internetController
                                            .isInternetConnected.value ==
                                        true) {
                                      if (passwordController.text ==
                                          confirmPasswordController.text) {
                                        apihitting.value = true;
                                        UserModel DriverData = UserModel(
                                            email: emailController.text,
                                            deviceId: DataStroge.DeviceID.value,
                                            fcmToken: DataStroge.fcmToken.value,
                                            password: passwordController.text,
                                            fullName: fullnameController.text,
                                            userName: usernameController.text,
                                            phoneNumber: Phonecontroller.text,
                                            ssn: SSNcontroller.text);

                                        // await AppService.getInstance
                                            // .RegisterationApi(
                                            //     context, DriverData, 'user');

                                        // Navigation.getInstance.RightToLeft_PageNavigation(context, otpVerificationScreen());
                                        apihitting.value = false;
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: 'Passowrd Must Be Same');
                                      }
                                    } else {
                                      FlutterToastDisplay.getInstance.showToast(
                                          "Please Check Your Internet");
                                    }
                                  }
                                },
                              )),
                          SizedBox(height: 10.sp),
                          SizedBox(
                            height: 10.sp,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigation.getInstance
                                  .pagePushAndReplaceNavigation(
                                      context, SignInScreen());
                            },
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                    color: themecontroller.textcolor
                                        .withOpacity(0.5),
                                    fontSize: 11.sp),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Already have an account?",
                                  ),
                                  TextSpan(
                                    text: ' SIGN UP',
                                    
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: themecontroller.colorPrimary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
