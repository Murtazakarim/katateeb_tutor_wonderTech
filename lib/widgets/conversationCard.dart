import 'package:flutter/material.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';

import '../helper/helper_class.dart';
class ConversationCard extends StatelessWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationCard({Key? key,required this.name,required this.imageUrl,required this.messageText,required this.time,required this.isMessageRead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
      margin: const EdgeInsets.only(bottom: 8),
      height: 74,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            SizedBox(
                width: 49,
                height: 46,
                child: Image.asset(imageUrl,fit: BoxFit.fill,)),
            getSizeSpaceW10(9),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name,style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w700,fontSize: 16,color: AppColors.primary,fontFamily: 'Almarai'),)
                  ],),
                getSizeSpaceH10(3),
                Row(
                  children: [
                    Text(messageText,style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w700,fontSize: 12,color: isMessageRead ? Colors.black: AppColors.greyColor,fontFamily: 'Almarai'),),
                  ],),
              ],),
            Expanded(child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
                  child: Text(time,style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Almarai'),textAlign: TextAlign.left,),
                ))),
          ],
        ),

      ),
    );
  }
}
