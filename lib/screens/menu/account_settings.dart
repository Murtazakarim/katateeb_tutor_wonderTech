import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/screens/authentication/changePasswordScreen.dart';
import 'package:katateeb_tutor/screens/menu/profile_personly.dart';

import '../../helper/helper_class.dart';
class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

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
              child: getCustomAppBar(text: 'اعدادات الحساب')),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const ProfilePersonly());
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Text('الملف الشخصى',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 16,fontWeight: FontWeight.w700,),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const ChangePasswordScreen());
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Text('تغيير كلمة المرور',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 16,fontWeight: FontWeight.w700,),),
                        ],
                      ),
                    ),
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
