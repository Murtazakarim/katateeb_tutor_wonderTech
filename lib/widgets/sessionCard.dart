import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';
class SessionCardWidget extends StatelessWidget {
  String subjectName;
  SessionCardWidget({Key? key,required this.subjectName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(left: 5,right: 5,bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0)),
            border: Border.all(color: Colors.white)

        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subjectName,style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 18,fontWeight: FontWeight.w700)),
                 /* getSizeSpaceH10(3),
                  Row(children: [
                    const Image(image: Svg(Assets.imgMortarboardLight,size: Size(22, 22),color: AppColors.primary)),
                    getSizeSpaceW10(8),
                    Text("عمار عبدالله",style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12),),
                  ]),*/
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
                      Text("05:00م",style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Almarai'),),
                    ]),
                  ],
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}
