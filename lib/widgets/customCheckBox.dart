import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
class CustomCheckBoxWidget extends StatefulWidget {
  Function (bool) onCheck;
  String text;
  CustomCheckBoxWidget({Key? key,required this.text,required this.onCheck}) : super(key: key);

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: _value ? AppColors.greenColor :AppColors.lightGreyColor),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
        alignment: Alignment.center,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCheckBox(
              value: _value,
              borderWidth: 1,
              borderRadius: 3,
              borderColor: AppColors.lightGreyColor,
              checkBoxSize: 20,
              checkedFillColor: AppColors.primary,
              onChanged: (bool value) {
              setState(() {
                _value = value;
                widget.onCheck(_value);
              });
            },
            ),
            /*const SizedBox(
              width: 4,
            ),*/
            Text(widget.text,
                style: AppColors.kTextStyleSize14linkColor.copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.lightGreyColor)),
          ],
        ),
      ),
    );
  }
}
