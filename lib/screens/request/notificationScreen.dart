import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:katateeb_tutor/widgets/notifyCard.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.15,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
               scrollDirection: Axis.vertical,
               itemBuilder: (BuildContext context, int index) {
                 return Padding(
                   padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                   child: NotifyCard(text: 'تم تقديم طلب جلسة برقم #2313 وجارى مراجعه طلبك',read: false),
                 );
               },
            ),
          ],
        ),
      ),
    );
  }
}
