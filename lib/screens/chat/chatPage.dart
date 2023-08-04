import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/generated/assets.dart';

import '../../appStyles/appColors.dart';
import '../../helper/helper_class.dart';
import '../../models/chatMessageModel.dart';
import '../../widgets/backButtonWidget.dart';
import '../../widgets/customButtonWidget.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "أهلا اخت أمل", messageType: "receiver"),
    ChatMessage(messageContent: "أهلا أستاذ سعد كيف الحال", messageType: "sender"),
    ChatMessage(messageContent: "أنا بخير والحمد لله", messageType: "receiver"),
    ChatMessage(messageContent: "أرسلت إليك التقارير الخاصة بألاء", messageType: "receiver"),
    ChatMessage(messageContent: "نعم وصلتني شكرا جزيلا", messageType: "sender"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      decoration:   InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.lightGreyColor,),
                        ),
                        contentPadding: const EdgeInsets.all(5),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.lightGreyColor,),
                        ),
                        hintText: "اكتب رسالتك",
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: GoogleFonts.almarai(
                          color: AppColors.lightGreyColor,
                        ),
                        suffixIcon:  SizedBox(
                          width: 30,
                          child: Row(
                            children: [
                              Container(color: AppColors.greyColor,height: 26,width: 1,),
                              getSizeSpaceW10(10),
                              const Image(image: Svg(Assets.imgFileDockFill,size: Size(24, 24)),),
                            ],
                          ),
                        ),
                        counter: const SizedBox(),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                getSizeSpaceW10(8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primary,
                  ),
                  margin: const EdgeInsets.only(bottom: 5),
                  width: 43,
                  height: 48,
                  child: const Image(image: Svg(Assets.imgSendIcon,size: Size(16, 14)),),
                ),
              ],

            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 43),
              child: getCustomAppBar(text: 'عمار عبدالله')),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                physics: const ScrollPhysics(),
                itemBuilder: (context, index){
                  return Container(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 3),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                      child: Row(
                        mainAxisAlignment: messages[index].messageType == "receiver" ? MainAxisAlignment.start:MainAxisAlignment.end,
                        children: [
                          if(messages[index].messageType == "receiver")
                            checkProfileShowOrNot(index,messages),
                          if(messages[index].messageType == "receiver")
                          getSizeSpaceW10(8),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (messages[index].messageType  == "receiver"?Colors.white:AppColors.primary),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Text(messages[index].messageContent, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'Almarai',color: (messages[index].messageType  == "receiver"? Colors.black:Colors.white) ),),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget checkProfileShowOrNot(int index,List<ChatMessage> messages){
    if(index > 0){
      if(messages[index].messageType == 'receiver'){
        int upIndex = index - 1;
        if (messages[upIndex].messageType == 'receiver'){
          return const SizedBox(
              width: 32,
              height: 31,);
        }
      }
    }
    return SizedBox(
        width: 32,
        height: 31,
        child: Image.asset(Assets.imgProfileIcon,fit: BoxFit.fill,));
  }
}
