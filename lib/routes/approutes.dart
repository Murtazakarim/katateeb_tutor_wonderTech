import 'package:get/get.dart';
import 'package:katateeb_tutor/routes/routesName.dart';
import 'package:katateeb_tutor/screens/authentication/changePasswordScreen.dart';
import 'package:katateeb_tutor/screens/authentication/forgotPasswordScreen.dart';
import 'package:katateeb_tutor/screens/authentication/otpScreen.dart';
import 'package:katateeb_tutor/screens/authentication/registerScreen.dart';
import 'package:katateeb_tutor/screens/authentication/signInScreen.dart';
import 'package:katateeb_tutor/screens/authentication/signupScreen.dart';
import 'package:katateeb_tutor/screens/onBoarding/onBoardingScreens.dart';

import '../splashScreen.dart';

appRoutes() => [
  GetPage(
    name: AppRoutes.initial,
    page: () =>  const SplashScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.onboard,
    page: () =>  OnBoardingScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.signup,
    page: () =>  const SignUpScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.otp,
    page: () =>  OtpScreen(comeFrom: ''),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.register,
    page: () =>  const RegisterScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () =>  const SignInScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),

  GetPage(
    name: AppRoutes.forgot,
    page: () =>  const ForgotPassword(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.cpass,
    page: () =>  const ChangePasswordScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
/*

  GetPage(
    name: AppRoutes.home,
    page: () =>  HomeScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.addson,
    page: () =>  const AddSonScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),

  GetPage(
    name: AppRoutes.evaluation,
    page: () =>  const RequestEvaluation(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),

  GetPage(
    name: AppRoutes.findTeacher,
    page: () =>  const FindTeacherScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.tutot,
    page: () =>  const SelectYourTutot(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),

  GetPage(
    name: AppRoutes.pay,
    page: () =>  const PaymentScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.confirmPay,
    page: () =>  const ConfirmPayment(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.confirmPay,
    page: () =>  const OverAllAssessment(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.detail,
    page: () =>  const DetailSession(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.detail,
    page: () =>  const SessionScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.conversation,
    page: () =>  const ConversationsScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.chat,
    page: () =>  const ChatPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.account,
    page: () =>  const AccountSettings(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: AppRoutes.profilePerson,
    page: () =>  const ProfilePersonly(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
  ),*/
];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}