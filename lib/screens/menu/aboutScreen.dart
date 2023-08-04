import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';

import '../../helper/helper_class.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 43),
              child: getCustomAppBar(text: 'عن التطبيق')),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                      child: SvgPicture.asset(Assets.imgLogo,width: 195,height: 195,)),
                  SizedBox(
                    height: Get.height * 0.5,
                    child: Text("منصة تميز  سكول تمكن الآباء من حجز جلسات خصوصية لأطفالهم مع مدرسين متخصصين لمتابعة وتمكين مهاراتهم الأساسية مثل القراءة والكتابة والحساب.وتهدف المنصة إلى توفير طريقة ملائمة وفعالة للآباء للعثور على مدرسين وحجزهم وتمكينهم من مساعدة أطفالهم على تحسين مهاراتهم الأساسية في هذه المجالات.\n\nستسمح المنصة للآباء بالبحث عن مدرسين بناءً على موقعهم ومهاراتهم المتخصصة. كما سيوفر للمعلمين طريقة لتقديم جلسات التقييم كخطوة أولى لتحديد مستوى ومجالات التحسين اللازمة لمهارات الطفل الأساسية. بمجرد اكتمال التقييم ، يمكن للوالدين حجز جلسات التدريس مع المعلم المختار ، والتي يمكن تقديمها حضوريا في مواقع معتمدة من المنصة.",style: AppColors.kTextStyleSize14grayColor.copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black,letterSpacing: 0.14),textDirection: TextDirection.rtl,textAlign: TextAlign.start,maxLines: 18,softWrap: true,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
