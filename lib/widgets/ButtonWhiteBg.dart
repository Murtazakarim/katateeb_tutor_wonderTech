import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../appStyles/appColors.dart';
class ButtonWhiteBg extends StatelessWidget {
  String text;
  double height;
  Function onTap;
  ButtonWhiteBg({Key? key,required this.text,this.height=50,required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.primary),
          color: Colors.white,
        ),
        child: Text(
          text,
          style:  TextStyle(
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.1,
            fontFamily: 'Almaria'
          ),
        ),
      ),
    );
  }
}
