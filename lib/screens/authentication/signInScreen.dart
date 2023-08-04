import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/screens/authentication/forgotPasswordScreen.dart';
import 'package:katateeb_tutor/widgets/customButtonWidget.dart';

import '../../appStyles/appColors.dart';
import '../../widgets/phoneNumberPackage/phonenumber_input.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _passwordVisible = false;
  GlobalKey siKey = GlobalKey();
  bool _confirmPasswordVisible = false;
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
            CustomButtonWidget(text: "تسجيل",height: 50, onTap: (){

            },),
            const SizedBox(height: 10,),
            RichText(
              text: TextSpan(text: 'ليس لديك حساب؟',style: GoogleFonts.almarai(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black), children: [
                TextSpan(
                  text: '  انشاء حساب',
                  style: GoogleFonts.almarai(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.linkColor),
                  recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
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
                children: [
                  SizedBox(height: Get.height * 0.2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('تسجيل الدخول',style: GoogleFonts.almarai(color: AppColors.primary,fontWeight: FontWeight.w800,fontSize: 22),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.center,
                    child: AutoSizeText('أهلا بك مرة أخرى، أدخل بيانات حسابك للدخول',
                      style: GoogleFonts.almarai(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 14,letterSpacing: 0.8),
                      softWrap: true,
                      maxLines: 3,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(
                    height: 58,
                    child: PhoneNumberInput(
                      initialCountry: 'TN',
                      locale: 'ar',
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
                      }, offsetKey: siKey,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    child: TextFormField(
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
                        counter: const SizedBox(),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: (){
                            Get.to(()=>const ForgotPassword());
                          },
                          child: Text('هل نسيت كلمة السر؟ ',style: AppColors.kTextStyleSize14linkColor,textDirection: TextDirection.rtl,textAlign: TextAlign.start))),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
