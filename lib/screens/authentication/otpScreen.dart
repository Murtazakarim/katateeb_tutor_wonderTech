import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/screens/authentication/changePasswordScreen.dart';
import 'package:katateeb_tutor/screens/authentication/registerScreen.dart';
import 'package:katateeb_tutor/widgets/customButtonWidget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../widgets/backButtonWidget.dart';
class OtpScreen extends StatefulWidget {
  String? comeFrom;
  OtpScreen({Key? key,this.comeFrom}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
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
            CustomButtonWidget(text: "تحقق",height: 50, onTap: (){
              if(widget.comeFrom == 'signUp'){
                Get.to(()=>const RegisterScreen());
              }else{
                Get.to(()=>const ChangePasswordScreen());
              }
            },),
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
                  fit: BoxFit.cover,
                ),
                color: Colors.transparent,
              ),
            ),
            Positioned(
              top: 50,
                right: 10,
                child: BackButtonWidget(onTap: ()=>Get.back(),)),
            Column(
              children: [
                SizedBox(height: Get.height * 0.2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('أدخل الرمز المرسل إلى جوالك',style: GoogleFonts.almarai(color: AppColors.primary,fontWeight: FontWeight.w800,fontSize: 22),),
                  ],
                ),
                const SizedBox(height: 10,),
                RichText(
                  text: TextSpan(text: '', children: [
                    WidgetSpan(child: AutoSizeText('+012345678 ',style: GoogleFonts.almarai(color: AppColors.greyColor,fontWeight: FontWeight.w900,fontSize: 14,letterSpacing: 0.8),textDirection: TextDirection.ltr,)),
                    WidgetSpan(child: AutoSizeText('تم إرسال الرمز إلى رقم جوال',style: GoogleFonts.almarai(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontSize: 14,letterSpacing: 0.8),textDirection: TextDirection.rtl,)),
                  ]),
                ),
                SizedBox(height: Get.height * 0.1,),
                PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  obscureText: true,
                  obscuringCharacter: '*',
                  // obscuringWidget: const FlutterLogo(
                  //   size: 24,
                  // ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    selectedColor: AppColors.lightGreyColor,
                    activeColor: AppColors.lightGreyColor,
                    selectedFillColor: AppColors.backgroundColor,
                    inactiveFillColor: Colors.white,
                    fieldHeight: 64,
                    fieldWidth: 71,
                    fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 5),
                    inactiveColor: AppColors.lightGreyColor,
                    activeFillColor: Colors.white,
                  ),
                  cursorColor: Colors.black,

                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: pinEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                    //  currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
                const SizedBox(height: 5,),
                RichText(
                  text: TextSpan(text: ' لم يصلك الكود؟',style: GoogleFonts.almarai(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black), children: [
                    TextSpan(
                      text: '  إعادة ارسال',
                      style: GoogleFonts.almarai(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.linkColor),
                      recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                    )
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {

    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }
}
