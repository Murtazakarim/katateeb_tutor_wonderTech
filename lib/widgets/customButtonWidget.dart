import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../appStyles/appColors.dart';
class CustomButtonWidget extends StatelessWidget {
  String text;
  double height;
  Function onTap;
  double margin;
  CustomButtonWidget({Key? key,required this.text,this.height=50,required this.onTap,this.margin =12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(horizontal: margin),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.primary,
        ),
        child: Text(
          text,
          style:  GoogleFonts.almarai(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
