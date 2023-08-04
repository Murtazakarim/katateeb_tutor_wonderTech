import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';
import 'package:katateeb_tutor/screens/authentication/otpScreen.dart';
import 'package:katateeb_tutor/screens/authentication/signInScreen.dart';
import 'package:katateeb_tutor/widgets/customButtonWidget.dart';
import 'package:katateeb_tutor/widgets/customDropDownWidget.dart';

import '../../appStyles/appColors.dart';
import '../../generated/assets.dart';
import '../../widgets/TextFieldWidget.dart';
import '../../widgets/phoneNumberPackage/phonenumber_input.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  GlobalKey suKey1 = GlobalKey();
  GlobalKey suKey2 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonWidget(text: "التالي",height: 50, onTap: (){
              Get.to(()=> OtpScreen(comeFrom: 'signUp',));
            },),
            const SizedBox(height: 10,),
            RichText(
              text: TextSpan(text: 'هل لديك حساب بالفعل؟',style: GoogleFonts.almarai(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black), children: [
                TextSpan(
                  text: ' تسجيل الدخول',
                  style: GoogleFonts.almarai(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.linkColor),
                  recognizer: TapGestureRecognizer()..onTap = () => Get.to(()=>const SignInScreen()),
                )
              ]),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                  width: Get.width,
                  height: Get.height * 0.32,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imgGroupIcon,),
                  fit: BoxFit.fill,
                ),
                color: Colors.transparent,
              ),
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('إنشاء حساب جديد',style: GoogleFonts.almarai(color: AppColors.primary,fontWeight: FontWeight.w800,fontSize: 22),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.center,
                    child: AutoSizeText('تحتاج إلى إدخال رقم جوال صحيح (تستلم عليه كود تحقق من 4 خانات)، وكلمة السر وتأكيدها',
                      style: GoogleFonts.almarai(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 14,letterSpacing: 0.8),
                      softWrap: true,
                      maxLines: 3,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 64,),
                  SizedBox(
                    height: 58,
                    child: PhoneNumberInput(
                      initialCountry: 'TN',
                      locale: 'ar',
                      padding: 15,
                      controller: PhoneNumberInputController(
                        context,
                      ),

                      hint: "رقم الجوال",
                      enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor,),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor,),
                      ),
                      onChanged: (phone) {
                        print(phone);
                      }, offsetKey: suKey1,
                    ),
                  ),
                  getSizeSpaceH10(4),
                  TextFieldWidget(
                    hintText: "رقم الهوية",
                    icon: const Image(
                      image: Svg(Assets.imgUserIcon, size: Size(26, 26)),
                    ),
                  ),
                  getSizeSpaceH10(4),
                  CustomDropDownWidget(widgetKey: suKey2,),
                  getSizeSpaceH10(4),
                  TextFormField(
                    obscureText: !_passwordVisible,
                    decoration:   InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor,),
                      ),
                      contentPadding: const EdgeInsets.all(15),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor,),
                      ),
                      hintText: "كلمة السر",
                      errorStyle: const TextStyle(height: 0),
                      prefixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.lightGreyColor,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: GoogleFonts.almarai(
                        color: AppColors.lightGreyColor,
                      ),
                      suffixIcon: const Image(image: Svg(Assets.imgLockIcon,size: Size(26, 26)),),
                      counter: null,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  getSizeSpaceH10(4),
                  TextFormField(
                    obscureText: !_confirmPasswordVisible,
                    decoration:   InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor,),
                      ),

                      contentPadding: const EdgeInsets.all(15),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor,),
                      ),
                      hintText: "تأكيد كلمة السر",
                      errorStyle: const TextStyle(height: 0),
                      prefixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.lightGreyColor,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                      ),
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: GoogleFonts.almarai(
                        color: AppColors.lightGreyColor,
                      ),
                      suffixIcon: const Image(image: Svg(Assets.imgLockIcon,size: Size(26, 26)),),
                      counter: null,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
