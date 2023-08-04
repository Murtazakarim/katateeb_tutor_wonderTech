import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';
import 'package:katateeb_tutor/screens/evaluation/detailSession.dart';
import 'package:katateeb_tutor/widgets/profileCard.dart';
import '../../widgets/dropDownWithImage.dart';
class HomePage extends StatelessWidget {
  bool dropDownValue;
  bool sonAdded;
  bool reminder;
  HomePage({Key? key,this.dropDownValue =false,this.sonAdded=false,this.reminder=false}) : super(key: key);
  final GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.12,
            ),
            /*Row(
              children: [
                if(dropDownValue)
                 Expanded(child: DropDownWithImage(widgetKey: widgetKey,)),
              ],
            ),*/
            getSizeSpaceH10(40),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 28,
                    //margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0)),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Row(
                      children: [
                        const Image(image: Svg(Assets.imgInfoFillWhiteE,size: Size(18, 18))),
                        getSizeSpaceW10(4),
                        AutoSizeText('تذكير بميعاد الجلسة القادمة',style: AppColors.kTextStyleSize14linkColor.copyWith(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    //margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0)),
                      border: Border.all(color: AppColors.primary)

                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("جلسة التقييم",style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 20,fontWeight: FontWeight.w700)),
                              getSizeSpaceH10(2),
                              Row(children: [
                                const Image(image: Svg(Assets.imgUserIcon,size: Size(22, 22),color: AppColors.primary)),
                                getSizeSpaceW10(8),
                                Text("عمار عبدالله",style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12),),
                              ]),
                            ],
                          ),
                        ),
                        Container(width: 1,color: AppColors.lightGreyColor,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  const Image(image: Svg(Assets.imgLocationIcon,size: Size(22, 22),color: AppColors.primary)),
                                  getSizeSpaceW10(8),
                                  Text("سنتر المدينة",style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12),),
                                ]),
                                getSizeSpaceH10(4),
                                Row(children: [
                                  const Image(image: Svg(Assets.imgCalendarLight,size: Size(22, 22),color: AppColors.primary)),
                                  getSizeSpaceW10(8),
                                  Text("السبت - 21 ابريل",style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12),),
                                ]),
                                getSizeSpaceH10(4),
                                Row(children: [
                                  const Image(image: Svg(Assets.imgTimeLight,size: Size(22, 22),color: AppColors.primary)),
                                  getSizeSpaceW10(4),
                                  Text("05:00م",style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12),),
                                ]),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),

                  ),
                ],
              ),
            ),
            getSizeSpaceH10(20),
            Directionality(textDirection: TextDirection.ltr, child: getHeading('جلساتك '),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('ليس لديك أي طلاب مسجلين حتى الان',style: AppColors.kTextStyleSize14grayColor,),
              ],
            ),
            getSizeSpaceH10(16),
            GestureDetector(onTap:(){
              Get.to(()=>const DetailSession());
            }, child: ProfileCard(index: 0)),
          ],
        ),
      ),
    );
  }
}
