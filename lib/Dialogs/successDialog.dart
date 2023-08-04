import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
class SuccessDialog extends StatelessWidget {
  String text;
  SuccessDialog({Key? key,required this.text}) : super(key: key);

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
            height: Get.height * 0.4,
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
                    const Image(image: Svg(Assets.imgCheckIcon,size: Size(70, 100))),
                    const SizedBox(height: 10,),
                    Text(text,softWrap: true,textAlign: TextAlign.center,style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 20,fontWeight: FontWeight.w700,),)
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
