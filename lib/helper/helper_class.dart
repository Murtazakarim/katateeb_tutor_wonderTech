import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/widgets/backButtonWidget.dart';

import '../appStyles/appColors.dart';
import '../widgets/linear_indicator_progress_bar_widget.dart';
Widget getHeading(String text){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(text,style: AppColors.kTextStyleSize14grayColor.copyWith(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700,letterSpacing: 0.3,fontFamily: 'Almarai'),textDirection: TextDirection.rtl,textAlign: TextAlign.right,),
    ],
  );
}

Widget getDivider(){
  return const Divider(color: AppColors.lightGreyColor,height: 1,);
}

getSizeSpaceH10(double h){
  return SizedBox(height: h,);
}

getSizeSpaceW10(double w){
  return SizedBox(width: w,);
}

Widget getCustomAppBar({required String text}){
  return ListTile(
    leading: const SizedBox(),
    contentPadding: EdgeInsets.zero,
    title: Text(text,style: AppColors.kTextStyleSize22primaryColor,textAlign: TextAlign.center),
    trailing: BackButtonWidget(
      onTap: () => Get.back(),
    ),
  );
}

Widget getContent({required String text,required double percent,required MainAxisAlignment mainAxisAlignment}){
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: Text(text,style: AppColors.kTextStyleSize14grayColor.copyWith(color: Colors.black),textAlign: TextAlign.start)),
        getSizeSpaceH10(4),
        LinearPercentIndicator(
          backgroundColor: AppColors.disableColor,
          isRTL: true,
          percent: percent/100,
          lineHeight: 26,
          horizontal: true,
          mainAxis: mainAxisAlignment,
          padding: EdgeInsets.zero,
          barRadius: const Radius.circular(5),
          progressColor:AppColors.secondaryColor,
          alignment: MainAxisAlignment.end,
          center:  Text("${percent.toString()}%",style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 12,fontWeight: FontWeight.w400),),
        ),
      ],
    ),
  );
}