import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart'as sp;
import 'package:get/get.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/screens/onBoarding/onBoardingScreens.dart';

import 'appStyles/appColors.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
     body: Container(
       width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: sp.Svg(Assets.imgSplashBackground),
        fit: BoxFit.cover,
      ),
    ),
    child:  Center(child:SvgPicture.asset(Assets.imgLogo,width: 230,height: 230,),
    ),
    ),
    );
  }

  @override
  void initState() {
    initScreen();
    super.initState();
  }

  initScreen() async{
  await Future.delayed(const Duration(seconds: 5),
            ()=>Get.offAll(()=>OnBoardingScreen()));
  }
}
