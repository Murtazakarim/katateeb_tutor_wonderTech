import 'package:dotted_border/dotted_border.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/screens/menu/session_Menu.dart';
import 'package:katateeb_tutor/widgets/TextFieldWidget.dart';
import 'package:katateeb_tutor/widgets/customDropDownWidget.dart';

import '../../helper/helper_class.dart';
import '../../widgets/customButtonWidget.dart';
import '../../widgets/phoneNumberPackage/phonenumber_input.dart';
class ProfilePersonly extends StatefulWidget {
  const ProfilePersonly({Key? key}) : super(key: key);

  @override
  State<ProfilePersonly> createState() => _ProfilePersonlyState();
}

class _ProfilePersonlyState extends State<ProfilePersonly> {
  GlobalKey ppKey = GlobalKey();
  GlobalKey ppKey2 = GlobalKey();
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
              text: "تعديل",
              height: 50,
              onTap: () async {
                Get.to(()=>const SessionMenuScreen());
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 43),
              child: getCustomAppBar(text: 'الملف الشخصى')),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Column(
              children: [
                TextFieldWidget(
                  hintText: "فيصل سليمان",
                  icon: const Image(
                    image: Svg(Assets.imgUserIcon, size: Size(26, 26)),
                  ),
                ),

                SizedBox(
                  height: 58,
                  child: PhoneNumberInput(
                    initialCountry: 'TN',
                    locale: 'ar',
                    controller: PhoneNumberInputController(
                      context,
                    ),

                    hint: "01232134123",
                    padding: 15,
                    enabledBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightGreyColor,),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightGreyColor,),
                    ),
                    onChanged: (phone) {
                      print(phone);
                    }, offsetKey: ppKey2,
                  ),
                ),
                getSizeSpaceH10(8),
                CustomDropDownWidget(widgetKey: ppKey),
                getSizeSpaceH10(8),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DottedBorder(
                    color: AppColors.lightGreyColor,
                    dashPattern: const [2, 1, 2, 1],
                    strokeWidth: 2,
                    child: Container(
                      height: 60,
                      width: Get.width,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      child:  Row(
                        children: [
                          SizedBox(
                              width: 46,
                              height: 44,
                              child: Image.asset(Assets.imgProfileIcon,fit: BoxFit.fill,)),
                          const SizedBox(width: 10,),
                          Expanded(child: Text('321314.png',style: GoogleFonts.almarai(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.lightGreyColor,letterSpacing: 0.5),)),
                          const Image(
                            image: Svg(Assets.imgTablerPhotoEdit, size: Size(27, 27)),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
