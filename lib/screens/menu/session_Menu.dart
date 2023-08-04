import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';

import '../../appStyles/appColors.dart';
class SessionMenuScreen extends StatelessWidget {
  const SessionMenuScreen({Key? key}) : super(key: key);

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
              child: getCustomAppBar(text: 'الجلسات')),
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
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                    child:  Row(
                      children: [
                        const Image(image: Svg(Assets.imgMoneysBlack,size: Size(28,28)),),
                        getSizeSpaceW10(12),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('1200',style: AppColors.kTextStyleSize14grayColor.copyWith(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),),
                                Text(' ر,س',style: AppColors.kTextStyleSize14grayColor.copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                              ],
                            ),
                            Text('رصيدك من الجلسات',style: AppColors.kTextStyleSize14grayColor.copyWith(fontSize: 14,fontWeight: FontWeight.w400,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  getSizeSpaceH10(12),
                  getDivider(),
                  getSizeSpaceH10(12),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
