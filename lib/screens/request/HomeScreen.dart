import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/screens/request/lessons_screen.dart';
import 'package:katateeb_tutor/screens/request/notificationScreen.dart';

import '../chat/conversationsScreen.dart';
import '../menu/DrawerWidget.dart';
import 'homePage.dart';
class HomeScreen extends StatefulWidget {
  bool dropDownValue;
  bool sonAdded;
  bool reminder;
  HomeScreen({Key? key,this.dropDownValue = false,this.sonAdded =false,this.reminder=false}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 3;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget pages(int page){
    switch(page){
      case 0:
        return const NotificationScreen();
      case 1:
        return const ConversationsScreen();
      case 2:
        return const LessonsScreen();
      case 3:
        return HomePage(dropDownValue: widget.dropDownValue,sonAdded: widget.sonAdded,reminder: widget.reminder,);
      default:
        return HomePage(dropDownValue: widget.dropDownValue,sonAdded: widget.sonAdded,reminder: widget.reminder,);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      drawer: const DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
          items:   const <BottomNavigationBarItem>[
             BottomNavigationBarItem(
              icon: Image(image: Svg(Assets.imgBellLight,size: Size(36, 36))),
              label: 'الاشعارات',
               activeIcon: Image(image: Svg(Assets.imgBellFillActive,size: Size(36, 36))),
            ),
            BottomNavigationBarItem(
              icon: Image(image: Svg(Assets.imgChatLight,size: Size(36, 36))),
              label: 'الرسائل',
              activeIcon: Image(image: Svg(Assets.imgChatFillActive,size: Size(36, 36))),
            ),
            BottomNavigationBarItem(
                icon: Image(image: Svg(Assets.imgPeopleIcons,size: Size(36, 36))),
                label: 'الجلسات',
              activeIcon: Image(image: Svg(Assets.imgPeopleLightIcons,size: Size(36, 36))),
            ),
            BottomNavigationBarItem(
                icon: Image(image: Svg(Assets.imgHomeLightUnactive,size: Size(36, 36))),
                label: 'الرئيسية',
              activeIcon: Image(image: Svg(Assets.imgHomeFill,size: Size(36, 36))),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.greyColor,
          unselectedLabelStyle: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.greyColor),
          selectedLabelStyle: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.primary),
          selectedIconTheme: const IconThemeData(
            size: 36,
            color: AppColors.primary,
          ),
          unselectedIconTheme:const IconThemeData(
            size: 36,
            color: AppColors.greyColor,
          ),
          iconSize: 36,
          onTap: _onItemTapped,
          elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            if(_selectedIndex != 0 && _selectedIndex != 1 && _selectedIndex != 2)
            Container(
              width: Get.width,
              height: Get.height * 0.32,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.imgGroupIcon,
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.transparent,
              ),
            ),
          Stack(
            children: [
              Positioned(
                  top: 35,
                  child: SizedBox(
                    width: Get.width,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      leading:Container(
                        width: 50,
                        height: 47,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        // margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child:  Center(
                          child: IconButton(onPressed: (){
                            print('hello');
                          _key.currentState!.openDrawer();
                          }, icon: const Icon(Icons.menu,color: AppColors.primary,size: 28,),
                          ),
                        ),),
                      title:_selectedIndex == 0 || _selectedIndex ==1 || _selectedIndex == 2 ? Text(_selectedIndex ==0? "الاشعارات":_selectedIndex ==1 ? "الرسائل":"الدروس",style: AppColors.kTextStyleSize22primaryColor,textAlign: TextAlign.center,)
                          :Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          height: 47,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),),
                          child:  Row(children: [
                            Container(
                              width: 36,height: 33,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(Assets.imgProfileIcon,fit: BoxFit.fill,),),
                            Text('فيصل سليمان ',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 0.5,color: Colors.black),)
                          ],),
                        ),
                      ),
                    ),
                  )),
              pages(_selectedIndex),
            ],
          ),
          ],
        ),
      ),
    );
  }
}
