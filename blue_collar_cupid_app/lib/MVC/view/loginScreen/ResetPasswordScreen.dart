// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:blue_collar_cupid_app/MVC/view/loginScreen/SetNewPasswordScreen.dart';
// import 'package:blue_collar_cupid_app/components/BottomNav.dart';
// import 'package:blue_collar_cupid_app/MVC/view/loginScreen/DriverRegisterationScreen.dart';
// import 'package:blue_collar_cupid_app/components/custom_textfiled.dart';
// import 'package:blue_collar_cupid_app/components/spring_widget.dart';
// import 'package:blue_collar_cupid_app/constant/constants.dart';
// import 'package:blue_collar_cupid_app/constant/navigation.dart';
// import 'package:blue_collar_cupid_app/constant/theme.dart';
// import 'package:blue_collar_cupid_app/services/app_service.dart';
// import 'package:get/get.dart';
// import '../../../components/round_button.dart';
// import '../../../constant/flutter_toast.dart';
// import '../../../helper/internet_controller.dart';

// class ResetPasswordScreen extends StatelessWidget {
//   ResetPasswordScreen({super.key});

//   final internetController = Get.put(InternetController());

//   final _formkey = GlobalKey<FormState>();
//   final name = TextEditingController();
//   final emailController = TextEditingController();
//   final PasswordController = TextEditingController();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();
//   RxBool showpassword = true.obs;
//   RxBool apihitting = false.obs;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ThemeHelper>(builder: (themecontroller) {
//       return AnnotatedRegion(
//         value: themecontroller.systemUiOverlayStyleForwhite,
//         child: Scaffold(
//           resizeToAvoidBottomInset: true,
//           appBar: AppBar(
//               centerTitle: true,
//               title: Text(
//                 'Reset Password',
//                 style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
//               )),
//           body: Container(
//             height: 550.sp,
//             decoration: BoxDecoration(
//               color: themecontroller.backgoundcolor,
//               // boxShadow: [
//               //   BoxShadow(
//               //     color: themecontroller.backgoundcolor.withOpacity(0.4),
//               //     spreadRadius: 9.5,
//               //     blurRadius: 40,
//               //     offset: const Offset(0, 2), // changes position of shadow
//               //   ),
//               // ],
//               // borderRadius: BorderRadius.only(
//               //     topLeft: Radius.circular(10.sp),
//               //     topRight: Radius.circular(10.sp))
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: Constants.screenPadding),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 20.sp,
//                         ),
//                         Expanded(
//                             flex: 3,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Container(
//                                     height: 100.sp,
//                                     width: 100.sp,
//                                     child: SvgPicture.asset(
//                                       "assets/icons/lock.svg",
//                                       height: 20.sp,
//                                       width: 20.sp,
//                                     ),
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'Passsword Recovery',
//                                       style: TextStyle(
//                                           fontSize: 20.sp,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'Enter your registered email below to receive \npassword instructions',
//                                       style: TextStyle(
//                                           fontSize: 12.sp,
//                                           color: Colors.grey,
//                                           fontWeight: FontWeight.normal),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             )),
//                         Expanded(
//                           flex: 4,
//                           child: Form(
//                             key: _formkey,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CustomTextFieldWidget(
//                                   enabled: true,
//                                   label: '',
//                                   controller: emailController,
//                                   hintText: "enter your email address",
//                                   inputType: TextInputType.emailAddress,
//                                   focusNode: _emailFocusNode,
//                                   onsubmit: () {},
//                                   onchange: (value) {},
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter an email address';
//                                     }
//                                     const emailPattern =
//                                         r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$';
//                                     if (!RegExp(emailPattern).hasMatch(value)) {
//                                       return 'Please enter a valid email address';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 SizedBox(height: 30.sp),
//                                 Obx(() => RoundButton(
//                                       gradient: false,
//                                       margin: 0,
//                                       backgroundColor:
//                                           themecontroller.colorPrimary,
//                                       height: 60.sp,
//                                       loading: apihitting.value,
//                                       disabled: apihitting.value,
//                                       title: 'get otp',
//                                       iconColor: themecontroller.colorwhite,
//                                       textColor: themecontroller.colorwhite,
//                                       onTap: () async {
//                                         await internetController
//                                             .internetCheckerFun();

//                                         if (_formkey.currentState!.validate()) {
//                                           // if (internetController
//                                           //         .isInternetConnected.value ==
//                                           //     true) {
//                                           apihitting.value = true;
//                                           Navigation.getInstance
//                                               .screenNavigation(context,
//                                                   SetNewPasswordScreen());
//                                           // AppService.getInstance.login(
//                                           //     context,
//                                           //     emailController.text,
//                                           //     PasswordController.text);
//                                           // Navigation.getInstance
//                                           //     .screenNavigation(
//                                           //         context, HomeScreen());
//                                           // Navigation.getInstance
//                                           //     .pagePushAndReplaceNavigation(
//                                           //         context,
//                                           //         content_screen(
//                                           //           buttontext: 'save',
//                                           //           content:
//                                           //               "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem. Veritatisobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquamnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdamrecusandae alias error harum maxime adipisci amet laborum. Perspiciatis minima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit ",
//                                           //           heading: 'Notification',
//                                           //           imagpath:
//                                           //               'notificationimg.png',
//                                           //         ));

//                                           // } else {
//                                           //   FlutterToastDisplay.getInstance
//                                           //       .showToast("Please check your internet");
//                                           // }
//                                         }
//                                       },
//                                     )),
//                                 SizedBox(height: 20.sp),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: Constants.screenPadding),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
