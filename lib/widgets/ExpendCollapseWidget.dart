import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/widgets/linear_indicator_progress_bar_widget.dart';

import '../helper/helper_class.dart';
import 'expendedTIleWIdget.dart';
class ExpendCollapseWidget extends StatefulWidget {
  String iconPath1;
  String iconPath2;
  String text;
  double percent;

  ExpendCollapseWidget({Key? key,required this.text,required this.iconPath1,required this.iconPath2,required this.percent}) : super(key: key);

  @override
  State<ExpendCollapseWidget> createState() => _ExpendCollapseWidgetState();
}

class _ExpendCollapseWidgetState extends State<ExpendCollapseWidget> {
  bool _isExpanded = false;
  // Controller
  late ExpandedTileController _controller;

  @override
  void initState() {
    // initialize controller
    _controller = ExpandedTileController(isExpanded:false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ExpandedTile(
        title: Container(
          child:  Column(
            children: [
              Row(
                children: [
                  Image(image: Svg( _isExpanded ? widget.iconPath1 :widget.iconPath2,size: const Size(24,24))),
                  getSizeSpaceW10(3),
                  Text(widget.text,style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 20,fontWeight: FontWeight.w700,color: _isExpanded ? Colors.white : AppColors.primary),),
                  const Expanded(child: SizedBox()),
                  Align(
                      alignment: Alignment.centerLeft,
                      child:_isExpanded ?
                      const Icon(Icons.keyboard_arrow_left_outlined,size: 32,color: Colors.white)
                          :const Icon(Icons.keyboard_arrow_down,size: 32,color: AppColors.primary)),
                ],
              ),
              getSizeSpaceH10(7),
              LinearPercentIndicator(
                backgroundColor: AppColors.disableColor,
                isRTL: true,
                percent: widget.percent/100,
                lineHeight: 26,
                horizontal: true,
                mainAxis: MainAxisAlignment.end,
                padding: EdgeInsets.zero,
                barRadius: const Radius.circular(5),
                progressColor:_isExpanded ? Colors.white : AppColors.primary,
                alignment: MainAxisAlignment.end,
                center:  Text('${widget.percent}%',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 14,fontWeight: FontWeight.w400),),
              ),
            ],
          ),
        ),
        trailing: const SizedBox(),
        content:  Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              getContent(text: 'الحروف بالحركات',percent: 54,mainAxisAlignment: MainAxisAlignment.end ),
              getContent(percent: 23,text: 'الحروف بالتنوين',mainAxisAlignment: MainAxisAlignment.end),
              getContent(text: 'ال الشمسية والقمرية',percent:86,mainAxisAlignment: MainAxisAlignment.end),
              getContent(text: 'التاء المربوطة والمفتوحة',percent: 46,mainAxisAlignment: MainAxisAlignment.end),
            ],
          ),
        ),
        controller: _controller,
        contentseparator: 0,
        theme: ExpandedTileThemeData(
            headerColor:_isExpanded ? AppColors.primary : Colors.white,
            trailingPadding: EdgeInsets.zero,
            leadingPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            headerSplashColor: null,
            contentBackgroundColor: Colors.white,
            headerPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8)
        ),
        onTap: () {
          if(_controller.isExpanded){
            setState(() {
              _isExpanded = _controller.isExpanded;
            });
          }else{
            setState(() {
              _isExpanded = _controller.isExpanded;
            });
          }
        },
      ),
    );
  }
}
