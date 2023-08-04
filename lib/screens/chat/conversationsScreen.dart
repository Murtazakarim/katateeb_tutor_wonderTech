import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';
import 'package:katateeb_tutor/screens/chat/chatPage.dart';
import 'package:katateeb_tutor/widgets/TextFieldWidget.dart';
import 'package:katateeb_tutor/widgets/conversationCard.dart';

import '../../models/chatMessageModel.dart';
class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({Key? key}) : super(key: key);

  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "عمار عبدالله", messageText: "نعم وصلتني شكرا جزيلا", imageURL: Assets.imgProfileIcon, time: "02:32م"),
    ChatUsers(name: "عمار عبدالله", messageText: "نعم وصلتني شكرا جزيلا", imageURL: Assets.imgProfileIcon, time: "02:34م"),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.17,),
          TextFieldWidget(hintText: 'بحث', icon: const Image(
            image: Svg(Assets.imgSearchLight, size: Size(26, 26)),
          ),),
          getSizeSpaceH10(13),
          ListView.builder(
            shrinkWrap: true,
            itemCount: chatUsers.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Get.to(()=>const ChatPage());
                },
                  child: ConversationCard(name: chatUsers[index].name, imageUrl: chatUsers[index].imageURL, messageText: chatUsers[index].messageText, time: chatUsers[index].time, isMessageRead: index ==1 ? false:true,));
            },
          ),


        ],
      ),
    );
  }
}
