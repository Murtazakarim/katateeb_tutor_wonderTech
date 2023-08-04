import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/helper/helper_class.dart';
class TimerPickerDialog extends StatefulWidget {
  const TimerPickerDialog({Key? key}) : super(key: key);

  @override
  State<TimerPickerDialog> createState() => _TimerPickerDialogState();
}

class _TimerPickerDialogState extends State<TimerPickerDialog> {
  int startTime = 0;
  int endTime = 7;
  List<String> times = ['04:00 PM',"05:00 PM","06:00 PM","07:00 PM","08:00 PM","09:00 PM","10:00 PM","11:00 PM"];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Dialog(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              elevation: 1,
              child:  Container(
                width: Get.width,
                height: Get.height *0.3,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text('حدد الاوقات المتاحة يوميا',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontWeight: FontWeight.w700,fontSize: 20),),
                    getSizeSpaceH10(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('من',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.black),),
                        Container(
                          width: 80,
                          height: 122,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.lightGreyColor),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(onPressed: (){
                                if(startTime < 7){
                                  setState(() {
                                    startTime++;
                                  });
                                }
                              }, icon: const Icon(Icons.keyboard_arrow_up_outlined,size: 24,)),
                              Text(times[startTime],style: AppColors.kTextStyleSize14grayColor.copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.grey[800]),textDirection: TextDirection.ltr),
                              IconButton(onPressed: (){
                                if(startTime > 0){
                                  setState(() {
                                    startTime --;
                                  });
                                }
                              }, icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,)),
                            ],
                          ),
                        ),
                        Text('الى',style: AppColors.kTextStyleSize14grayColor.copyWith(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.black),),
                        Container(
                          width: 80,
                          height: 122,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.lightGreyColor),
                          ),
                          child: Column(
                            children: [
                              IconButton(onPressed: (){
                                if(endTime < 7){
                                  setState(() {
                                    endTime++;
                                  });
                                }
                              }, icon: const Icon(Icons.keyboard_arrow_up_outlined,size: 24,)),
                              Text(times[endTime],style: AppColors.kTextStyleSize14grayColor.copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.grey[800]),textDirection: TextDirection.ltr),
                              IconButton(onPressed: (){
                                if(endTime > 0){

                                  setState(() {
                                    endTime --;
                                  });
                                }
                              }, icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,)),
                            ],
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
