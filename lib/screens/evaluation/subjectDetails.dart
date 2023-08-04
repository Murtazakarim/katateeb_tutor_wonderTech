import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';
import 'package:katateeb_tutor/widgets/customDropDownWidget.dart';

import '../../widgets/customButtonWidget.dart';
import '../../widgets/expendedRatingWidget.dart';
import '../../widgets/expendedTIleWIdget.dart';
class SubjectDetails extends StatefulWidget {
  const SubjectDetails({Key? key}) : super(key: key);

  @override
  State<SubjectDetails> createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> {
  GlobalKey sdKey1 = GlobalKey();

  GlobalKey sdKey2 = GlobalKey();
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
                CustomDropDownWidget(widgetKey: sdKey1),
                getSizeSpaceH10(4),
                CustomDropDownWidget(widgetKey: sdKey2),
                getSizeSpaceH10(12),
                getDivider(),
                getSizeSpaceH10(12),
                const ExpendedRatingWidget(),
                getSizeSpaceH10(8),
                const ExpendedRatingWidget(),
                getSizeSpaceH10(8),
                const ExpendedRatingWidget(),
                getSizeSpaceH10(12),
                getDivider(),
                getSizeSpaceH10(12),
                getHeading('الملاحظات'),
                getSizeSpaceH10(8),
                Container(
                  height: 114,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.primary),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(child: Text('خلافاَ للاعتقاد السائد فإن لوريم إيبسوم ليس نصاَ عشوائياً، بل إن له جذور في الأدب اللاتيني الكلاسيكي ',softWrap: true,style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 16,fontWeight: FontWeight.w400,),)),
                      ],
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
