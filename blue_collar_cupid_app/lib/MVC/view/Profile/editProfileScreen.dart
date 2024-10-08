import 'dart:io';

import 'package:blue_collar_cupid_app/MVC/view/Profile/uploadprofileImageScreen.dart';
import 'package:blue_collar_cupid_app/components/custom_appbar.dart';
import 'package:blue_collar_cupid_app/components/custom_textfiled.dart';
import 'package:blue_collar_cupid_app/components/round_button.dart';
import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/navigation.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:blue_collar_cupid_app/helper/data_storage.dart';
import 'package:blue_collar_cupid_app/helper/getx_helper.dart';
import 'package:blue_collar_cupid_app/helper/internet_controller.dart';
import 'package:blue_collar_cupid_app/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final internetController = Get.put(InternetController());
  final getcontroller = Get.put(GetxControllersProvider());
  File? selectedImage;
  final usernameController = TextEditingController();
  final fullnameController = TextEditingController();
  final Biocontroller = TextEditingController();
  final Phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  RxBool apihitting = false.obs;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
          value: themecontroller.systemUiOverlayStyleForwelcomeScreen,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                  surfaceTintColor: Colors.white,
                  title: Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: themecontroller.colorPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.sp),
                  )),
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.screenPadding,
                    vertical: Constants.screenPadding),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => SpringWidget(
                            onTap: () {
                              Navigation.getInstance.RightToLeft_PageNavigation(
                                  context, uploadprofileImageScreen());
                            },
                            child: Stack(children: [
                              getcontroller.imagePath.value.isNotEmpty
                                  ? CircleAvatar(
                                      radius: 70.sp,
                                      backgroundImage: FileImage(
                                          File(getcontroller.imagePath.value)),
                                    )
                                  : CircleAvatar(
                                      radius: 70.sp,
                                      backgroundImage: AssetImage(getcontroller
                                          .defaultImagePath
                                          .toString()),
                                    ),
                              Positioned(
                                bottom: 0,
                                right: 10.sp,
                                child: CircleAvatar(
                                  child: Icon(Icons.edit),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        CustomTextFieldWidget(
                          controller: fullnameController,
                          hintText: '',
                          inputType: TextInputType.name,
                          onsubmit: () {},
                          TextColor: Colors.black,
                          label: DataStroge.FullName.value == ''
                              ? 'Full Name'
                              : DataStroge.FullName.value,
                          validator: (value) {
                            if (value == '' &&
                                DataStroge.FullName.value == '') {
                              return 'Please Enter The Updated Name';
                            }
                          },
                          enabled: true,
                        ),
                        CustomTextFieldWidget(
                          controller: usernameController,
                          hintText:
                              // DataStroge.userPhone.value == ''
                              //     ?
                              'User Name',
                          // : DataStroge.userPhone.value,
                          onsubmit: () {},
                          inputType: TextInputType.name,
                          TextColor: Colors.black,
                          label: DataStroge.userName.value == ''
                              ? 'User Name'
                              : DataStroge.userName.value,
                          validator: (value) {
                            if (value == '' &&
                                DataStroge.userName.value == '') {
                              return 'Please Enter The Updated User Name';
                            }
                          },
                          enabled: true,
                        ),
                        // CustomTextFieldWidget(
                        //   controller: Phonecontroller,
                        //   hintText: DataStroge.userEmail.value == ''
                        //       ? 'Email Address'
                        //       : DataStroge.userEmail.value,
                        //   inputType: TextInputType.name,
                        //   TextColor: Colors.black,
                        //   label: '',
                        //   validator: (value) {
                        //     if (value == '' &&
                        //         DataStroge.userPhone.value == '') {
                        //       return 'Please Enter The Updated Email Address';
                        //     }
                        //   },
                        //   enabled: true,
                        //
                        // ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       flex: 1,
                        //       child: CustomTextFieldWidget(
                        //         controller: Phonecontroller,
                        //         hintText: 'city',
                        //         inputType: TextInputType.name,
                        //         TextColor: Colors.black,
                        //         label: '',
                        //         validator: (value) {
                        //           if (value == '' &&
                        //               DataStroge.userPhone.value == '') {
                        //             return 'Please Enter The Updated city';
                        //           }
                        //         },
                        //         enabled: true,
                        //
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 10.sp,
                        //     ),
                        //     Expanded(
                        //       flex: 1,
                        //       child: CustomTextFieldWidget(
                        //         controller: Phonecontroller,
                        //         hintText: 'state',
                        //         inputType: TextInputType.name,
                        //         TextColor: Colors.black,
                        //         label: '',
                        //         validator: (value) {
                        //           if (value == '' &&
                        //               DataStroge.userPhone.value == '') {
                        //             return 'Please Enter The Updated state';
                        //           }
                        //         },
                        //         enabled: true,
                        //
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       flex: 1,
                        //       child: CustomTextFieldWidget(
                        //         controller: Phonecontroller,
                        //         hintText: 'Vehicle Make',
                        //         inputType: TextInputType.name,
                        //         TextColor: Colors.black,
                        //         label: '',
                        //         validator: (value) {
                        //           if (value == '' &&
                        //               DataStroge.userPhone.value == '') {
                        //             return 'Please Enter The Updated Vehicle Make';
                        //           }
                        //         },
                        //         enabled: true,
                        //
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 10.sp,
                        //     ),
                        //     Expanded(
                        //       flex: 1,
                        //       child: CustomTextFieldWidget(
                        //         controller: Phonecontroller,
                        //         hintText: 'Vehicle Model',
                        //         inputType: TextInputType.name,
                        //         TextColor: Colors.black,
                        //         label: '',
                        //         validator: (value) {
                        //           if (value == '' &&
                        //               DataStroge.userPhone.value == '') {
                        //             return 'Please Enter The Updated state';
                        //           }
                        //         },
                        //         enabled: true,
                        //
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       flex: 1,
                        //       child: CustomTextFieldWidget(
                        //         controller: Phonecontroller,
                        //         hintText: 'Vehicle No',
                        //         inputType: TextInputType.name,
                        //         TextColor: Colors.black,
                        //         label: '',
                        //         validator: (value) {
                        //           if (value == '' &&
                        //               DataStroge.userPhone.value == '') {
                        //             return 'Please Enter The Updated Vehicle No';
                        //           }
                        //         },
                        //         enabled: true,
                        //
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 10.sp,
                        //     ),
                        //     Expanded(
                        //       flex: 1,
                        //       child: CustomTextFieldWidget(
                        //         controller: Phonecontroller,
                        //         hintText: 'Vehicle Color',
                        //         inputType: TextInputType.name,
                        //         TextColor: Colors.black,
                        //         label: '',
                        //         validator: (value) {
                        //           if (value == '' &&
                        //               DataStroge.userPhone.value == '') {
                        //             return 'Please Enter The Updated Vehicle Color';
                        //           }
                        //         },
                        //         enabled: true,
                        //
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // CustomTextFieldWidget(
                        //   controller: Phonecontroller,
                        //   hintText: 'Vehicle Registration No & Expiry Date',
                        //   inputType: TextInputType.name,
                        //   TextColor: Colors.black,
                        //   label: '',
                        //   validator: (value) {
                        //     if (value == '' &&
                        //         DataStroge.userPhone.value == '') {
                        //       return 'Please Enter The Updated Vehicle Registration No & Expiry Date';
                        //     }
                        //   },
                        //   enabled: true,
                        //
                        // ),
                        SizedBox(
                          height: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                padding: EdgeInsets.all(10.sp),
                child: Obx(
                  () => RoundButton(
                      height: 45.sp,
                      title: 'Update Profile',
                      loading: apihitting.value,
                      disabled: apihitting.value,
                      margin: 0,
                      textColor: Colors.white,
                      backgroundColor:
                          themecontroller.colorPrimary.withOpacity(0.8),
                      borderColor:
                          themecontroller.colorPrimary.withOpacity(0.8),
                      onTap: () async {
                        if (_formkey.currentState!.validate()) {
                          apihitting.value = true;
                          // UserModel userData = UserModel(
                          //     id: 1,
                          //     name: Firstnamecontroller.text == ''
                          //         ? DataStroge.userName.value
                          //         : Firstnamecontroller.text,
                          //     email: '',
                          //     image: getcontroller.imagePath.value,
                          //     userType: '',
                          //     bio: Biocontroller.text == ''
                          //         ? DataStroge.userBio.value
                          //         : Biocontroller.text,
                          //     phone: Phonecontroller.text == ''
                          //         ? DataStroge.userphone.value
                          //         : Phonecontroller.text);
                          // await AppService.getInstance.editProfile(context,
                          //     usernameController.text, fullnameController.text);
                          apihitting.value = false;
                        }
                        apihitting.value = false;
                      }),
                ),
              ),
            ),
          ));
    });
  }
}
