import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/screens/request/yourRequestScreen.dart';
import 'package:katateeb_tutor/widgets/profileCard.dart';

import '../../appStyles/appColors.dart';
import '../../helper/helper_class.dart';
class LessonsScreen extends StatefulWidget {
  const LessonsScreen({Key? key}) : super(key: key);

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.15,),
            getSizeSpaceH10(32),
            Row(
              children: [
                getHeading('طلباتك'),
              ],
            ),
            getSizeSpaceH10(6),
            GestureDetector(
              onTap: (){
                Get.to(()=>const YourRequestScreen());
              },
                child: ProfileCard(index: 0,)),
            getSizeSpaceH10(12),
            getDivider(),
            getSizeSpaceH10(12),
            Directionality(textDirection: TextDirection.ltr, child: getHeading('جلساتك '),),
            getSizeSpaceH10(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('ليس لديك أي طلاب مسجلين حتى الان',style: AppColors.kTextStyleSize14grayColor,),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
