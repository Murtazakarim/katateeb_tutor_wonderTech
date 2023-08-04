import 'package:flutter/material.dart';


class AppColors  {
  static const Color primary = Color(0xff4D2C77);
  static const Color backgroundColor = Color(0xffF4F4F4);
  static const Color secondaryColor = Color(0xffC856A0);
  static const Color greyColor = Color(0xff979797);
  static const Color greyInActiveColor = Color(0xffB5B5B5);
  static const Color lightGreyColor = Color(0xffC2C2C2);
  static const Color disableColor = Color(0xffE2E2E2);
  static const Color errorColor = Color(0xffEB5757);
  static const Color greenColor = Color(0xff40C97B);
  static const Color linkColor = Color(0xff0066FF);


 static TextStyle kTextStyleSize14linkColor = const TextStyle(color: linkColor,fontWeight: FontWeight.w400,letterSpacing: 0.1,fontSize: 14,fontFamily: 'Almarai');
 static TextStyle kTextStyleSize22primaryColor = const TextStyle(color: AppColors.primary,fontWeight: FontWeight.w700,fontSize: 22,fontFamily: 'Almarai',letterSpacing: 0.1);
 static TextStyle kTextStyleSize14grayColor = const TextStyle(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 14,letterSpacing: 0.1,fontFamily: 'Almarai',);
}