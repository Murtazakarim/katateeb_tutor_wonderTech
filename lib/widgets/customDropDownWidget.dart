import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';
class CustomDropDownWidget extends StatefulWidget {
  ScrollController? scrollController;
  GlobalKey widgetKey;
  CustomDropDownWidget({Key? key,this.scrollController,required this.widgetKey}) : super(key: key);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  bool _isOpen = false;
  String dropDownValue = 'Item 1';
  double bottom = -7;
  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
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
        bottom = renderBox.size.height + 250;
      }

    });
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
    return  Container(
      key: widget.widgetKey,
      //width: Get.width,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: _isOpen ? AppColors.primary:AppColors.lightGreyColor,),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            value: dropDownValue,
            isExpanded: true,
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: const EdgeInsets.only(left: 3),
                child: SvgPicture.asset(Assets.imgArrowDownWard,width: 14,height: 9,fit: BoxFit.fill,),
              ),
              openMenuIcon: const Icon(Icons.keyboard_arrow_left_outlined,size: 32,color: AppColors.primary),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                  border: Border.all(color: AppColors.greyColor)
              ),
              elevation: 0,
              maxHeight: 250,
              offset: Offset(0, bottom),
            ),

            onMenuStateChange: (isOpen){
              setState(() {
                if(widget.scrollController != null){
                  widget.scrollController!.animateTo(
                      widget.scrollController!.position.minScrollExtent,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                }

                _isOpen = isOpen;
              });
            },
            style: GoogleFonts.almarai(fontSize: 16,color: AppColors.lightGreyColor),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                alignment: Alignment.centerRight,
                child: Text(items,textDirection: TextDirection.rtl,style: GoogleFonts.almarai(color: _isOpen ? AppColors.primary : AppColors.greyColor,fontSize: 14)),
                onTap: (){

                },
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
    );
  }
}
