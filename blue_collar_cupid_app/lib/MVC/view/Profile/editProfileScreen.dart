import 'dart:io';
import 'package:blue_collar_cupid_app/components/custom_textfiled.dart';
import 'package:blue_collar_cupid_app/components/image_widget.dart';
import 'package:blue_collar_cupid_app/components/round_button.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:blue_collar_cupid_app/helper/data_storage.dart';
import 'package:blue_collar_cupid_app/helper/getx_helper.dart';
import 'package:blue_collar_cupid_app/helper/internet_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
          value: themecontroller.systemUiOverlayStyleForwhite,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.white,
              appBar: AppBar(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  title: Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: themecontroller.colorPrimaryBlue,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                getcontroller.getImage();
                              },
                              child: Obx(() => getcontroller.imagePath.value !=
                                      ''
                                  ? getcontroller.imagePath.value
                                          .startsWith('http')
                                      ? Container(
                                          height: 150.sp,
                                          width: 100.sp,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                            child: ImageWidget(
                                                imageUrl: getcontroller
                                                    .imagePath.value),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                          ),
                                        )
                                      : Container(
                                          height: 150.sp,
                                          width: 100.sp,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.sp),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  File(getcontroller
                                                      .imagePath.value),
                                                ),
                                              )),
                                        )
                                  : DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(21.sp),
                                      strokeWidth: 2.sp,
                                      color: themecontroller.colorPrimaryBlue,
                                      dashPattern: [10.sp, 6.sp],
                                      child: Container(
                                          height: 150.sp,
                                          width: 100.sp,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            size: 30.sp,
                                          )),
                                    )),
                            ),
                            GestureDetector(
                              onTap: () {
                                getcontroller.getImage();
                              },
                              child: Obx(() => getcontroller.imagePath.value !=
                                      ''
                                  ? getcontroller.imagePath.value
                                          .startsWith('http')
                                      ? Container(
                                          height: 150.sp,
                                          width: 100.sp,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                            child: ImageWidget(
                                                imageUrl: getcontroller
                                                    .imagePath.value),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                          ),
                                        )
                                      : Container(
                                          height: 150.sp,
                                          width: 100.sp,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.sp),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  File(getcontroller
                                                      .imagePath.value),
                                                ),
                                              )),
                                        )
                                  : DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(21.sp),
                                      strokeWidth: 2.sp,
                                      color: themecontroller.colorPrimaryBlue,
                                      dashPattern: [10.sp, 6.sp],
                                      child: Container(
                                          height: 150.sp,
                                          width: 100.sp,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            size: 30.sp,
                                          )),
                                    )),
                            ),
                            GestureDetector(
                              onTap: () {
                                getcontroller.getImage();
                              },
                              child: Obx(() => getcontroller.imagePath.value !=
                                      ''
                                  ? getcontroller.imagePath.value
                                          .startsWith('http')
                                      ? Container(
                                          height: 150.sp,
                                          width: 100.sp,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                            child: ImageWidget(
                                                imageUrl: getcontroller
                                                    .imagePath.value),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                          ),
                                        )
                                      : Container(
                                          height: 150.sp,
                                          width: 100.sp,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.sp),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  File(getcontroller
                                                      .imagePath.value),
                                                ),
                                              )),
                                        )
                                  : DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(21.sp),
                                      strokeWidth: 2.sp,
                                      color: themecontroller.colorPrimaryBlue,
                                      dashPattern: [10.sp, 6.sp],
                                      child: Container(
                                          height: 150.sp,
                                          width: 100.sp,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            size: 30.sp,
                                          )),
                                    )),
                            ),
                          ],
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
                          controller: Biocontroller,
                          hintText: 'write something about your self',
                          maxLines: 5,
                          height: 100.sp,
                          inputType: TextInputType.name,
                          onsubmit: () {},
                          TextColor: Colors.black,
                          label: 'Bio',
                          
                          validator: (value) {
                            if (value == '' &&
                                DataStroge.FullName.value == '') {
                              return 'Please Enter The Updated Name';
                            }
                          },
                          enabled: true,
                        ),
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
                          themecontroller.colorPrimaryBlue,
                      borderColor:
                          themecontroller.colorPrimaryBlue,
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
