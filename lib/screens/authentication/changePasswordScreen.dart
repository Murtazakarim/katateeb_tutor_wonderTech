import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/Dialogs/successDialog.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/screens/authentication/signInScreen.dart';
import 'package:katateeb_tutor/widgets/backButtonWidget.dart';
import 'package:katateeb_tutor/widgets/customButtonWidget.dart';
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _passwordVisible = false;
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
            CustomButtonWidget(
              text: "تغيير كلمة السر",
              height: 50,
              onTap: () async {
                showDialog(context: context, builder: (context){
                  return SuccessDialog(text: 'قمنا بإنشاء حسابك لدينا بنجاح',);
                });
                await Future.delayed(const Duration(seconds: 2));
                Get.back();
                Get.to(()=>const SignInScreen());

              },
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
                  image: AssetImage(
                    Assets.imgGroupIcon,
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.transparent,
              ),
            ),
            Positioned(
                top: 50,
                right: 10,
                child: BackButtonWidget(
                  onTap: () => Get.back(),
                )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تغيير كلمة السر',
                        style: GoogleFonts.almarai(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 22),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      'قم بإختيار كلمة سر جديدة للدخول بها إلى حسابك مستقبلا',
                      style: GoogleFonts.almarai(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: 0.8),
                      softWrap: true,
                      maxLines: 3,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    obscureText: !_passwordVisible,
                    decoration:   InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor,),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor,),
                      ),
                      hintText: "كلمة السر الجديدة",
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
                  const SizedBox(height: 4,),
                  TextFormField(
                    obscureText: !_confirmPasswordVisible,
                    decoration:   InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor,),
                      ),

                      contentPadding: const EdgeInsets.all(20),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor,),
                      ),
                      hintText: "تأكيد كلمة السر الجديدة",
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
