import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';
import 'package:katateeb_tutor/screens/evaluation/subjectDetails.dart';
import 'package:katateeb_tutor/widgets/customDropDownWidget.dart';

import '../../widgets/customButtonWidget.dart';
class SessionEvaluation extends StatelessWidget {
  SessionEvaluation({Key? key}) : super(key: key);
GlobalKey seKey1 = GlobalKey();
GlobalKey seKey2 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SizedBox(
        height: 65,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                CustomButtonWidget(
                  text: "ارسال",
                  height: 46,
                  margin: 0,
                  onTap: () async {
                    Get.to(()=>const SubjectDetails());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Column(
              children: [
                getSizeSpaceH10(22),
                getCustomAppBar(text: 'تقييم الجلسة - 1'),
                getSizeSpaceH10(27),
                CustomDropDownWidget(widgetKey: seKey1),
                getSizeSpaceH10(4),
                CustomDropDownWidget(widgetKey: seKey2),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
