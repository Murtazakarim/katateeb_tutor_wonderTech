import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';

import '../widgets/dayButtonWidget.dart';
class DayPickerDialog extends StatefulWidget {
  const DayPickerDialog({Key? key}) : super(key: key);

  @override
  State<DayPickerDialog> createState() => _DayPickerDialogState();
}

class _DayPickerDialogState extends State<DayPickerDialog> {
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
            width: Get.width,
            height: Get.height * 0.4,
            alignment: Alignment.center,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                elevation: 1,
                child:  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text('حدد الأيام المتاحة للعمل',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w700,fontSize: 20),),
                      getSizeSpaceH10(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: DayButtonWidget(text: 'السبت',)),
                          Expanded(child: DayButtonWidget(text: 'الاحد',)),
                          Expanded(child: DayButtonWidget(text: 'الاثنين',)),
                        ],
                      ),
                      getSizeSpaceH10(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: DayButtonWidget(text: 'الثلاثاء',)),
                          Expanded(child: DayButtonWidget(text: 'الاربعاء',)),
                          Expanded(child: DayButtonWidget(text: 'الخميس',)),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
