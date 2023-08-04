import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/routes/approutes.dart';
import 'package:katateeb_tutor/routes/routesName.dart';

import 'appStyles/appColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Katateeb',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: 'Almarai',
        fontFamilyFallback: const ['Almarai'],
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: appRoutes(),
      initialRoute: AppRoutes.initial,
    );
  }
}