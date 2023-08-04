import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';
class ProfileCard extends StatefulWidget {
  int index;
  bool onTap;
  Color color;
  ProfileCard({Key? key,required this.index,this.onTap = true,this.color = AppColors.primary}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !widget.onTap ?(){
        if(click){
          setState(() {
            click = false;
          });

        }else{
          setState(() {
            click = true;
          });
        }

      }: null,
      onLongPress: (){
        print('click');
      },
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(10.5),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: click ? AppColors.primary :Colors.white,
          border: Border.all(color:widget.index ==1 && !click ? AppColors.greenColor: click? AppColors.primary : Colors.white),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              SizedBox(
                  width: 116,
                  height: 117,
                  child: Image.asset(Assets.imgSonIcon,fit: BoxFit.fill,)),
               getSizeSpaceW10(8),
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(children: [
                     Text('عمار عبدالله',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w700,fontSize: 18,color: click ? AppColors.lightGreyColor : widget.color,fontFamily: 'Almarai',letterSpacing: 0.1),textAlign: TextAlign.right,)
                   ],),
                   getSizeSpaceH10(2),
                   Row(
                     children: [
                       Text('الابن:',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.black,fontFamily: 'Almarai',letterSpacing: 0.1),),
                       getSizeSpaceW10(4),
                       Text('فهد',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w700,fontSize: 12,color: click ? AppColors.lightGreyColor : Colors.black,fontFamily: 'Almarai',letterSpacing: 0.1),)
                     ],
                   ),
                   getSizeSpaceH10(10),
                   Row(
                     children: [
                       Text('المرحلة الدراسية:',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.greyColor,fontFamily: 'Almarai',letterSpacing: 0.1),),
                       getSizeSpaceW10(4),
                       Text('الصف الثاني',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: click ? AppColors.lightGreyColor : widget.color,letterSpacing: 0.1),)
                     ],
                   ),
                   getSizeSpaceH10(4),
                   Row(
                     children: [
                       Text('الموقع:',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.greyColor,fontFamily: 'Almarai'),),
                       getSizeSpaceW10(4),
                       Text('الرياض',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: click ? AppColors.lightGreyColor : widget.color,fontFamily: 'Almarai'),)
                     ],
                   ),
                   getSizeSpaceH10(4),
                   Row(
                     children: [
                       Text('عدد الجلسات:',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.greyColor,fontFamily: 'Almarai'),),
                       getSizeSpaceW10(4),
                       Text('12 جلسة',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: click ? AppColors.lightGreyColor : widget.color,fontFamily: 'Almarai'),)
                     ],
                   ),
                 ],
               ),
            ],
          ),
        ),
      ),
    );
  }
}
