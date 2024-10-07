import 'package:blue_collar_cupid_app/components/spring_widget.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/data/mockData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:blue_collar_cupid_app/components/custom_textfiled.dart';
import 'package:blue_collar_cupid_app/components/image_widget.dart';
import 'package:blue_collar_cupid_app/constant/constants.dart';
import 'package:blue_collar_cupid_app/constant/theme.dart';
import 'package:blue_collar_cupid_app/helper/internet_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key, required this.image, required this.name})
      : super(key: key);
  final String image;
  final String name;
  final internetController = Get.put(InternetController());
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
        value: themecontroller.systemUiOverlayStyleForwhite,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20.sp,
                    child: ClipOval(
                      child: ImageWidget(
                          boxfit: BoxFit.cover,
                          height: 50.sp,
                          width: 50.sp,
                          imageUrl: image),
                    ),
                  ),
                  SizedBox(width: 5.sp),
                  Text(
                    name,
                    style: TextStyle(fontSize: 12.sp),
                  )
                ],
              ),
              // actions: [
              //   Icon(
              //     Icons.settings,
              //     color: Colors.black,
              //   ),
              //   SizedBox(width: Constants.screenPadding),
              // ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: MockData.dummyMassages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChatBubble(
                            message: Message(
                                sender:
                                    MockData.dummyMassages[index].Sendertype,
                                text: MockData.dummyMassages[index].content));
                      },
                    ),
                  ),
                ),
                //---textfield
                Container(
                  height: 50.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextFieldWidget(
                          height: 40.sp,
                          controller: messageController,
                          hintText: '',
                          TextColor: Colors.black,
                          fieldColor: Color.fromARGB(255, 244, 244, 245),
                          inputType: TextInputType.multiline,
                          label: 'write something..',
                          enabled: true,
                          onsubmit: () {},
                        ),
                      ),
                      SizedBox(width: 5.sp),
                      SpringWidget(
                        onTap: () async {},
                        child: CircleAvatar(
                          backgroundColor: themecontroller.colorPrimary,
                          radius: 20.sp,
                          child: SvgPicture.asset(
                            'assets/icons/send.svg',
                            color: Colors.white,
                            height: 15.sp,
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
      );
    });
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Align(
        alignment: message.sender == 'sender'
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: message.sender == 'sender'
                ? themecontroller.colorPrimaryBlue
                : themecontroller.colorPrimary,
            borderRadius: message.sender == 'sender'
                ? BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp))
                : BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp),
                    bottomLeft: Radius.circular(20.sp)),
          ),
          child: Text(
            message.text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}
