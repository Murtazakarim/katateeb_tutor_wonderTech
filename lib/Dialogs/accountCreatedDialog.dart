import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/widgets/ButtonWhiteBg.dart';
import 'package:katateeb_tutor/widgets/customButtonWidget.dart';
class AccountCreatedDialog extends StatelessWidget {
  const AccountCreatedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: Get.height * 0.58,
            alignment: Alignment.center,
            child: Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              elevation: 1,
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    const Image(image: Svg(Assets.imgExclamation,size: Size(39, 114))),
                    const SizedBox(height: 10,),
                    Text('يجب عليك تسجيل بيانات ابنك أولا',softWrap: true,textAlign: TextAlign.center,style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),),
                    const SizedBox(height: 20,),
                    CustomButtonWidget(text: 'سجل ابنك', onTap: (){
                     // Get.to(()=>const AddSonScreen());
                    },height: 46,),
                    const SizedBox(height: 8,),
                    ButtonWhiteBg(text: 'ليس الآن',onTap: (){},height: 46,),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
