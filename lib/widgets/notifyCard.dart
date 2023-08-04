import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
class NotifyCard extends StatelessWidget {
  bool read;
  String text;
  NotifyCard({Key? key,required this.text,required this.read,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: read ? Colors.white : AppColors.disableColor,
        border: Border.all(color: read ? AppColors.primary : AppColors.lightGreyColor),
      ),
      child:  Row(
        children: [
          Image(image: Svg(read ? Assets.imgTumerFill:Assets.imgTumerFillDark,size: const Size(36,36))),
          Expanded(child: Text(text,style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w100,fontSize: 16,color: read ? AppColors.primary : AppColors.greyColor),textAlign: TextAlign.start,)),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('منذ دقيقه',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w100,fontSize: 12,color: read ? AppColors.primary : AppColors.greyColor),),
              const SizedBox(height: 18,),
            ],
          ),

        ],
      ),
    );
  }
}
