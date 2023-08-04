import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
class CustomUserAddButton extends StatelessWidget {
  Function onTap;
  double height;
  double horizontalMargin;
  CustomUserAddButton({Key? key,required this.onTap,this.height=50,this.horizontalMargin=5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: AppColors.primary)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: Svg(Assets.imgUserAddIcon,size: Size(24, 24))),
            const SizedBox(width: 10,),
            Text(
              "اضافة ابن جديد",
              style:  GoogleFonts.almarai(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
