import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';
import 'package:katateeb_tutor/screens/evaluation/session_evaluation.dart';
import 'package:katateeb_tutor/widgets/customButtonWidget.dart';
import 'package:katateeb_tutor/widgets/sessionCard.dart';

import '../../widgets/ButtonWhiteBg.dart';
import '../../widgets/profileCard.dart';
class DetailSession extends StatefulWidget {
  const DetailSession({Key? key}) : super(key: key);

  @override
  State<DetailSession> createState() => _DetailSessionState();
}

class _DetailSessionState extends State<DetailSession> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SizedBox(
        height: 65,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButtonWidget(
                    text: "عرض التقرير",
                    height: 46,
                    margin: 0,
                    onTap: () async {
                      Get.to(()=> SessionEvaluation());
                      //Get.to(()=>const SessionScreen());
                    },
                  ),
                ),
                getSizeSpaceW10(4),
                Container(
                  width: 52,
                  height: 46,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.primary),
                    color: Colors.white,
                  ),
                  child: const Center(child: Image(image: Svg(Assets.imgChatAltLight,size: Size(32,32))),),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Column(
              children: [
                getSizeSpaceH10(22),
                getCustomAppBar(text: 'تفاصيل الجلسات'),
                getSizeSpaceH10(27),
                Container(
                  height: 158,
                  width: Get.width,
                  padding: const EdgeInsets.all(10.5),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 42,
                                height: 43,
                                child: Image.asset(Assets.imgSonIcon,fit: BoxFit.fill,)),
                            getSizeSpaceW10(8),
                            SizedBox(
                              height: 45,
                              width: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('عمار عبدالله',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w700,fontSize: 18,color:  AppColors.primary,fontFamily: 'Almarai',letterSpacing: 0.1),textAlign: TextAlign.right,),
                                    ],
                                  ),
                                  getSizeSpaceH10(2),
                                  Row(
                                    children: [
                                      Text('الابن:',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.black,fontFamily: 'Almarai',letterSpacing: 0.1),),
                                      getSizeSpaceW10(4),
                                      Text('فهد',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w700,fontSize: 12,color:  Colors.black,fontFamily: 'Almarai',letterSpacing: 0.1),),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getSizeSpaceH10(10),
                            Row(
                              children: [
                                Text('المرحلة الدراسية:',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.greyColor,fontFamily: 'Almarai',letterSpacing: 0.1),),
                                getSizeSpaceW10(4),
                                Text('الصف الثاني',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.primary ,letterSpacing: 0.1),)
                              ],
                            ),
                            getSizeSpaceH10(4),
                            Row(
                              children: [
                                Text('العمر:',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.greyColor,fontFamily: 'Almarai'),),
                                getSizeSpaceW10(4),
                                Text('9 سنوات',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.primary,fontFamily: 'Almarai'),)
                              ],
                            ),
                            getSizeSpaceH10(4),
                            Row(
                              children: [
                                Text('الموقع:',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.greyColor,fontFamily: 'Almarai'),),
                                getSizeSpaceW10(4),
                                Text('الرياض',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.primary,fontFamily: 'Almarai'),)
                              ],
                            ),
                            getSizeSpaceH10(4),
                            Row(
                              children: [
                                Text('عدد الجلسات:',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.greyColor,fontFamily: 'Almarai'),),
                                getSizeSpaceW10(4),
                                Text('12 جلسة',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.primary,fontFamily: 'Almarai'),)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                getSizeSpaceH10(12),
                getDivider(),
                getSizeSpaceH10(12),
                getHeading('الجلسات السابقة'),
                getSizeSpaceH10(8),
                SessionCardWidget(subjectName: 'الجلسة -  5',),
                SessionCardWidget(subjectName: 'الجلسة -  4',),
                SessionCardWidget(subjectName: 'الجلسة -  3',),
                SessionCardWidget(subjectName: 'الجلسة - 2',),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
