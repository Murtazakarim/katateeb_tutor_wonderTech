import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/screens/authentication/otpScreen.dart';
import 'package:katateeb_tutor/widgets/backButtonWidget.dart';
import 'package:katateeb_tutor/widgets/customButtonWidget.dart';


import '../../Dialogs/successDialog.dart';
import '../../appStyles/appColors.dart';
import '../../widgets/phoneNumberPackage/phonenumber_input.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey fpKey = GlobalKey();
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
              text: "التالي",
              height: 50,
              onTap: () async {
               Get.to(()=>OtpScreen(comeFrom: 'forgot',));
                // await Future.delayed(const Duration(seconds: 5));
                // Get.back();
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
                        'هل نسيت كلمة السر؟',
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
                      'لإستعادة كلمة السر، فضلا أدخل رقم الجوال المسجل لدينا',
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
                    height: 50,
                  ),
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
                      }, offsetKey: fpKey,
                    ),
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
