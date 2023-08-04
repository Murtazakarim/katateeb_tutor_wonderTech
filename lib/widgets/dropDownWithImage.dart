import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/Dialogs/accountCreatedDialog.dart';
import 'package:katateeb_tutor/generated/assets.dart';
import 'package:katateeb_tutor/widgets/customUserAddButton.dart';

import '../appStyles/appColors.dart';
class DropDownWithImage extends StatefulWidget {
  GlobalKey widgetKey;
  DropDownWithImage({Key? key,required this.widgetKey}) : super(key: key);

  @override
  State<DropDownWithImage> createState() => _DropDownWithImageState();
}

class _DropDownWithImageState extends State<DropDownWithImage> {
  Offset dropDownOffset = const Offset(-5, -1);
  String dropDownValue = 'Item 1';
  double bottom = -7;
  double left = 5;
  bool _isOpen = false;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'btn',
  ];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      getWidgetInfo();
    });
  }

  void getWidgetInfo() {
    final RenderBox renderBox = widget.widgetKey.currentContext?.findRenderObject() as RenderBox;
    widget.widgetKey.currentContext?.size;

    final Size size = renderBox.size;
    print('Size: ${size.width}, ${size.height}');

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    double y = renderBox.localToGlobal(Offset.zero).dy;
    print('Offset: ${offset.dx}, ${offset.dy}');
    double spaceAvailable = _getAvailableSpace(y + renderBox.size.height);
    setState(() {
      //dropDownOffset = offset;
      if(spaceAvailable > 250){
        bottom = size.height - 50;
      }else{
        bottom = renderBox.size.height -
            (250 + renderBox.size.height);
      }

    });

    print('OffsetD: ${dropDownOffset.dx}, ${dropDownOffset.dy}');

    print('Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
  }

  double _getAvailableSpace(double offsetY) {
    double safePaddingTop = MediaQuery.of(context).padding.top;
    double safePaddingBottom = MediaQuery.of(context).padding.bottom;

    double screenHeight =
        MediaQuery.of(context).size.height - safePaddingBottom - safePaddingTop;

    return screenHeight - offsetY;
  }
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        key: widget.widgetKey,
        width: Get.width,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color:_isOpen ? AppColors.secondaryColor: AppColors.primary,),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              value: dropDownValue,
              isExpanded: true,
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down,size: 32,color: AppColors.primary),
                iconSize: 32,
                openMenuIcon: Icon(Icons.keyboard_arrow_left_outlined,size: 32,color: AppColors.secondaryColor),
              ),

              onMenuStateChange: (isOpen){
                setState(() {
                  _isOpen = isOpen;
                });

              },
              dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                    border: Border.all(color: AppColors.secondaryColor)
                  ),
                  elevation: 0,
                  maxHeight: 250,
                  useSafeArea: true,
                  offset: Offset(-5, bottom),
                  /*scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),*/
              ),
              style: GoogleFonts.almarai(fontSize: 16,color:AppColors.primary),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  alignment: Alignment.centerRight,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: items != 'btn' ?Row(
                      children: [
                        Container(
                          width: 36,height: 33,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerRight,
                          child: Image.asset(Assets.imgProfileIcon,fit: BoxFit.fill,),),
                        const SizedBox(width: 10,),
                        Text(items,textDirection: TextDirection.rtl,style: GoogleFonts.almarai(color: _isOpen ? AppColors.secondaryColor:AppColors.primary,fontSize: 14)),
                      ],
                    ): Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomUserAddButton(onTap: (){
                            showDialog(context: context, builder: (context){
                              return const AccountCreatedDialog();
                            });
                          },),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){},
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropDownValue = newValue!;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
