import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
class DottedBorderButtonWidget extends StatelessWidget {
  const DottedBorderButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DottedBorder(
        color: AppColors.primary,
        dashPattern: const [2, 3, 2, 3],
        strokeWidth: 2,
        child: Container(
          height: 55,
          width: Get.width,
          color: Colors.white,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: Svg(Assets.imgUploadIcon,size: Size(26, 26))),
              const SizedBox(width: 10,),
              Text('تحميل صورة شخصية (اختياري)',style: GoogleFonts.almarai(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.primary,letterSpacing: 0.5),),
            ],
          ),
        ),
      ),
    );
  }
}
