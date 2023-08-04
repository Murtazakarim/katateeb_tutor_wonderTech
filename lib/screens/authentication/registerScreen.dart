import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/Dialogs/DayPickerDialog.dart';
import 'package:katateeb_tutor/Dialogs/TimePickerDialog.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/screens/request/HomeScreen.dart';
import 'package:katateeb_tutor/widgets/TextFieldWidget.dart';
import 'package:katateeb_tutor/widgets/TimePickerPackage.dart';
import 'package:katateeb_tutor/widgets/backButtonWidget.dart';
import 'package:katateeb_tutor/widgets/customButtonWidget.dart';
import 'package:katateeb_tutor/widgets/dottedBoardButtonWidget.dart';

import '../../Dialogs/successDialog.dart';
import '../../appStyles/appColors.dart';
import '../../helper/helper_class.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _value = false;
  final DateTime _dateTime = DateTime.now();
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
                showDialog(context: context, builder: (context){
                  return SuccessDialog(text: 'قمنا بإنشاء حسابك لدينا بنجاح',);
                });
                await Future.delayed(const Duration(seconds: 3));
                Get.to(()=> HomeScreen(dropDownValue: false,));

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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          'مرحبا بك في منصة تميز سكول',
                          style: GoogleFonts.almarai(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w800,
                              fontSize: 22,),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      'نحتاج معلومات إضافية لإتمام عملية تسجيل الحساب',
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
                    height: 64,
                  ),
                  TextFieldWidget(
                    hintText: "الاسم كامل",
                    icon: const Image(
                      image: Svg(Assets.imgUserIcon, size: Size(26, 26)),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFieldWidget(
                    hintText: "عدد سنوات الخبرة",
                    icon: const Image(
                      image: Svg(Assets.imgUserIcon, size: Size(26, 26)),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(context: context, builder: (_){
                          return const DayPickerDialog();
                        });
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.lightGreyColor,),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('اختر الايام المناسبة',style: AppColors.kTextStyleSize14grayColor.copyWith(color: AppColors.lightGreyColor,fontWeight: FontWeight.w400,fontSize: 16),textDirection: TextDirection.rtl),
                                    const Image(image: Svg(Assets.imgDateRange,size: Size(24,24))),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => const TimerPickerDialog(),
                        );
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.lightGreyColor,),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('اختر الاوقات المناسبة',style: AppColors.kTextStyleSize14grayColor.copyWith(color: AppColors.lightGreyColor,fontWeight: FontWeight.w400,fontSize: 16),textDirection: TextDirection.rtl),
                                    const Image(image: Svg(Assets.imgTimeDarkIcon, size: Size(26, 26))),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  getSizeSpaceH10(4),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: Get.width,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.lightGreyColor,),
                              ),
                              contentPadding: const EdgeInsets.all(15),
                              fillColor: Colors.white,
                              enabledBorder:const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.lightGreyColor,),
                              ),
                              filled: true,
                              hintText: "اضف وصف عنك",
                              hintTextDirection: TextDirection.rtl,
                              hintStyle: GoogleFonts.almarai(
                                color: AppColors.lightGreyColor,
                              ),
                              counter: const SizedBox(),
                            ),
                            maxLines: 4,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const DottedBorderButtonWidget(),
                  const SizedBox(
                    height: 11,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        SizedBox(
                          width:18,
                          height: 18,
                          child: CustomCheckBox(
                            value: _value,
                            borderWidth: 1,
                            borderRadius: 3,
                            borderColor: AppColors.lightGreyColor,
                            checkBoxSize: 18,
                            checkedFillColor: AppColors.primary,
                            onChanged: (bool value) {
                              setState(() {
                                _value = value;

                              });
                            },
                          ),
                        ),
                        getSizeSpaceW10(8),
                        Expanded(
                          child: Text('أوافق على شروط وأحكام تطبيق كتاتيب',
                              style: AppColors.kTextStyleSize14linkColor,softWrap: true,
                            maxLines: 2,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,),
                        ),
                      ],
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
