import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';

import '../../widgets/ExpendCollapseWidget.dart';
import '../../widgets/customButtonWidget.dart';
class YourRequestScreen extends StatefulWidget {
  const YourRequestScreen({Key? key}) : super(key: key);

  @override
  State<YourRequestScreen> createState() => _YourRequestScreenState();
}

class _YourRequestScreenState extends State<YourRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: Container(
        height: 65,
        color: Colors.transparent,
        width: Get.width,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    height: 46,
                    margin: const EdgeInsets.only(right: 16,),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.greenColor,
                    ),
                    child: const Text(
                      "قبول الطلب",
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              getSizeSpaceW10(4),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: Get.width * 0.35,
                  height: 46,
                  margin: const EdgeInsets.only(left: 16,),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.errorColor,
                  ),
                  child: const Text(
                    "رفض",
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Column(
              children: [
                getCustomAppBar(text: 'طلباتك'),
                getSizeSpaceH10(37),
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
                getHeading('التقييم العام للطالب'),
                getSizeSpaceH10(8),
                ExpendCollapseWidget(text: 'الكتابة',iconPath1: Assets.imgEditFill,iconPath2: Assets.imgEditFillLight,percent: 86,),
                getSizeSpaceH10(12),
                ExpendCollapseWidget(text: 'القراءه',iconPath1: Assets.imgBookClose,iconPath2: Assets.imgBookOpenFill,percent: 86,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
