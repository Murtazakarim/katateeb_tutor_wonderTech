import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../appStyles/appColors.dart';
import 'expendedTIleWIdget.dart';
class ExpendedRatingWidget extends StatefulWidget {
  const ExpendedRatingWidget({Key? key}) : super(key: key);

  @override
  State<ExpendedRatingWidget> createState() => _ExpendedRatingWidgetState();
}

class _ExpendedRatingWidgetState extends State<ExpendedRatingWidget> {
  late ExpandedTileController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ExpandedTileController(isExpanded:false);

  }
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ExpandedTile(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('القراءة',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 14),),
            Text('(4)',style: AppColors.kTextStyleSize22primaryColor.copyWith(fontSize: 16),),
            const SizedBox(width: 4,),
            Align(
                alignment: Alignment.centerLeft,
                child:_isExpanded ?
                const Icon(Icons.keyboard_arrow_left_outlined,size: 24,color: AppColors.primary)
                    :const Icon(Icons.keyboard_arrow_down,size: 24,color: AppColors.primary)),
          ],
        ),
        content: Directionality(
          textDirection: TextDirection.rtl,
          child:Column(
            children: [
              getRatingWidget(text: 'الحروف بالحركات',rating: 3),
              getRatingWidget(text: 'الحروف بالتنوين',rating: 5),
              getRatingWidget(text: 'ال الشمسية والقمرية',rating: 1),
              getRatingWidget(text: 'التاء المربوطة والمفتوحة',rating: 2),

            ],
          ),
        ),
        trailing: const SizedBox(),
        contentseparator: 8,
        theme: const ExpandedTileThemeData(
          headerColor: Colors.transparent,
          trailingPadding: EdgeInsets.zero,
          leadingPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          headerSplashColor: null,
          headerPadding: EdgeInsets.zero,
          contentRadius: 1,
          contentBackgroundColor: Colors.white,
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
        }, controller: _controller, title: const Text(''),
      ),
    );
  }

  Widget getRatingWidget({required String text,required double rating}){
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(child: Text(text,style: AppColors.kTextStyleSize14grayColor.copyWith(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400,),)),
          SizedBox(
            height: 32,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context,index){
                if(index <= rating){
                  return Container(
                    width: 31,
                    height: 32,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primary,
                    ),
                    child: Text(
                      (index + 1).toString(),
                      style:  GoogleFonts.almarai(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }else {
                  return Container(
                    width: 31,
                    height: 32,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: AppColors.primary)
                    ),
                    child: Text(
                      (index + 1).toString(),
                      style: GoogleFonts.almarai(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }                        },
            ),
          ),
        ],
      ),
    );
  }
}
