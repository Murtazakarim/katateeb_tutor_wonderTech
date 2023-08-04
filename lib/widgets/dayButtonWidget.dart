import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
class DayButtonWidget extends StatefulWidget {
  String text;
   DayButtonWidget({Key? key,required this.text}) : super(key: key);

  @override
  State<DayButtonWidget> createState() => _DayButtonWidgetState();
}

class _DayButtonWidgetState extends State<DayButtonWidget> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(click){
          setState(() {
            click = false;
          });

        }else {
          setState(() {
            click = true;
          });
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side:  BorderSide(color: click ? AppColors.primary : AppColors.lightGreyColor),
        ),
        elevation: 1,
        child: Container(
          height: 36,
          //margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color:  click ? AppColors.primary : Colors.white,
            border: Border.all(color: click ? AppColors.primary : AppColors.lightGreyColor),
          ),
          alignment: Alignment.center,
          child:  Center(child: AutoSizeText(widget.text,style: AppColors.kTextStyleSize14grayColor.copyWith(fontSize: 14,fontWeight: FontWeight.w700,color: click ? Colors.white :AppColors.greyColor),textAlign: TextAlign.center,softWrap: true,maxLines: 2,)),
        ),
      ),
    );
  }
}
