import 'package:flutter/material.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import '../../helper/helper_class.dart';
class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 43),
              child: getCustomAppBar(text: 'الاشتراكات')),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                      child:  Column(
                        children: [
                          doubleColorText(text1: 'المعلم:',text2: 'خالد منصور'),
                          doubleColorText(text1: 'المشكله الدراسية:',text2: 'القراءه'),
                          doubleColorText(text1: 'الموقع:',text2: 'الرياض'),
                          doubleColorText(text1: 'اليوم:',text2: 'السبت, الاثنين, الاربعاء  (اسبوعيا)'),
                          doubleColorText(text1: 'الوقت:',text2: '05:00م الي 07:00م'),
                        ],
                      ),
                    ),
                  ),
                  getSizeSpaceH10(8),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                      child:  Column(
                        children: [
                          doubleColorText(text1: 'المعلم:',text2: 'خالد منصور'),
                          doubleColorText(text1: 'المشكله الدراسية:',text2: 'القراءه'),
                          doubleColorText(text1: 'الموقع:',text2: 'الرياض'),
                          doubleColorText(text1: 'اليوم:',text2: 'السبت, الاثنين, الاربعاء  (اسبوعيا)'),
                          doubleColorText(text1: 'الوقت:',text2: '05:00م الي 07:00م'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget doubleColorText({required String text1,required String text2}){
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          getSizeSpaceW10(2),
          Text(text1,style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.greyColor),),
          getSizeSpaceW10(6),
          Text(text2,style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.primary),)
        ],
      ),
    );
  }
}
