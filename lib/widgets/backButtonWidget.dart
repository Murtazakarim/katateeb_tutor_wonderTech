import 'package:flutter/material.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
class BackButtonWidget extends StatelessWidget {
  Function onTap;
  BackButtonWidget({Key? key,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.symmetric(horizontal: 5,),
        child:  Center(
      child: IconButton(onPressed: ()=>onTap(), icon: const Icon(Icons.arrow_forward_ios_rounded,color: AppColors.primary),
      ),
      ),),
    );
  }
}
