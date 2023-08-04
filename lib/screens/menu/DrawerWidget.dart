

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/screens/menu/aboutScreen.dart';
import 'package:katateeb_tutor/screens/menu/account_settings.dart';
import 'package:katateeb_tutor/screens/menu/connectWithUs.dart';
import 'package:katateeb_tutor/screens/menu/subscriptionsScreen.dart';
import '../../Dialogs/accountCreatedDialog.dart';
import '../../generated/assets.dart';
import '../../helper/helper_class.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String gpValue ='0';
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        backgroundColor: AppColors.backgroundColor,
        shape: const RoundedRectangleBorder(),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            getSizeSpaceH10(40),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
              height: 60,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    SizedBox(
                        width: 44,
                        height: 42,
                        child: Image.asset(Assets.imgProfileIcon,fit: BoxFit.fill,)),
                    getSizeSpaceW10(9),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("فيصل سليمان ",style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w700,fontSize: 16,color: AppColors.primary,fontFamily: 'Almarai'),)
                          ],),
                        getSizeSpaceH10(3),
                        Row(
                          children: [
                            Text("01231451514",style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w700,fontSize: 12,color: AppColors.greyColor,fontFamily: 'Almarai'),),
                          ],),
                      ],),
                  ],
                ),

              ),
            ),
            getSizeSpaceH10(12),
            getListTileItems(text: "اعدادات الحساب",imgPath: Assets.imgSettingsIcon, callBack: (){
              Get.to(()=>const AccountSettings());

            }),
            getListTileItems(text: "الاشتراكات",imgPath: Assets.imgSettingsIcon, callBack: (){

              Get.to(()=>const SubscriptionsScreen());
            }),
            getListTileItems(text: "تواصل معنا",imgPath: Assets.imgMoneys, callBack: (){

              Get.to(()=>const ConnectWithUs());
            }),
            getListTileItems(text: "عن التطبيق",imgPath: Assets.imgMoneys, callBack: (){

              Get.to(()=>const AboutScreen());
            }),
            Row(
              children: [
                SvgPicture.asset(Assets.imgLogout),
                getSizeSpaceW10(5),
                Text('تسجيل الخروج',style: AppColors.kTextStyleSize14linkColor.copyWith(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.errorColor),),
              ],
            ),

          ],
        ),
      ),
    );
  }
  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => gpValue = value!);
  }

  Widget getListTileItems({required String text,required String imgPath,required Function callBack}){
    return GestureDetector(
      onTap: ()=>callBack(),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(bottom: 8),
        alignment: Alignment.center,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8,),
          leading: SvgPicture.asset(imgPath),
          title: Text(text,style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 16,fontWeight: FontWeight.w400),),
          trailing: const Directionality(textDirection: TextDirection.ltr,
              child: Icon(Icons.arrow_back_ios_rounded,color: AppColors.primary,)),

        ),
      ),
    );
  }
}
