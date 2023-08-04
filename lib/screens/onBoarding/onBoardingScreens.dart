import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/models/onBoardingModel.dart';
import 'package:katateeb_tutor/screens/authentication/signupScreen.dart';
import 'package:katateeb_tutor/screens/onBoarding/onBoardPackage.dart' as ob;
class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final PageController _pageController = PageController(initialPage: 2,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body:ob.OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: null,
        backButton: OnBoardConsumer(

          builder: (context, ref , child) {
            final state = ref.watch(onBoardStateProvider);
            return Center(
              child: IconButton(onPressed: ()=>_onBack(state), icon: const Icon(Icons.arrow_forward_ios_rounded,color: AppColors.primary),
              ),
            );
          }
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          // print('done tapped');
        },
        onBoardData: onBoardData,
        titleStyles: GoogleFonts.almarai(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.15,
        ),
        descriptionStyles: GoogleFonts.almarai(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
        ),
        pageIndicatorStyle: const ob.PageIndicatorStyle(
          width: 80,
          inactiveColor: AppColors.greyInActiveColor,
          activeColor: AppColors.primary,
          inactiveSize: Size(8, 8),
          activeSize: Size(24, 8),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: TextButton(
          onPressed: () {
            // print('skipButton pressed');
          },
          child: Text(
            "تخطي",
            style: GoogleFonts.almarai(color: AppColors.linkColor,fontSize: 16,fontWeight: FontWeight.w400),
          ),
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            int currentPage = 0;
            final state = ref.watch(onBoardStateProvider);
            if(_pageController.hasClients){
              currentPage = _pageController.page != null ? _pageController.page!.round() : 2;
            }else{
              currentPage = 2;
            }
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primary,
                ),
                child: Text(
                  currentPage !=0  ? "التالي" : "ابدأ  ",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (_pageController.page!.round() != 0) {
      _pageController.animateToPage(
        _pageController.page!.round() - 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      Get.to(()=> const SignUpScreen());
    }
  }

  void _onBack(OnBoardState onBoardState) {
    if (_pageController.page!.round() != 2) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }


}
