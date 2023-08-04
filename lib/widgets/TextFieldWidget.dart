import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
class TextFieldWidget extends StatefulWidget {
  String hintText;
  Widget icon;
  bool prefixIcon;
  TextFieldWidget({Key? key,required this.hintText,required this.icon,this.prefixIcon=false}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:   InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGreyColor,),
        ),
        contentPadding: const EdgeInsets.all(15),
        fillColor: Colors.white,
        enabledBorder:const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGreyColor,),
        ),
        filled: true,
        hintText: widget.hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: const TextStyle(
          color: AppColors.lightGreyColor,
          fontSize: 16,
          fontFamily: 'Almaria',
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: !widget.prefixIcon ? widget.icon: null,
        prefixIcon: widget.prefixIcon ?widget.icon:null,
        counter: null,
      ),
      textAlign: TextAlign.right,
    );
  }
}
