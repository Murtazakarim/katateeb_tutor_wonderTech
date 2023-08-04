import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/foundation.dart';

///interactive from to hours picker
///
/// the returned result will be two 24h [TimeOfDay]
class FromToTimePicker extends StatefulWidget {
  /// return the two picked [TimeOfDay] values
  ///
  /// on user click on ok Button
  final Function(TimeOfDay, TimeOfDay)? onTab;

  /// the header of the dialog
  ///
  /// can provide user with information or available time to pick
  final String? headerText;

  /// the color of dialog header text
  final Color? headerTextColor;

  /// submit button text
  final String? doneText;

  /// submit button text color
  final Color? doneTextColor;

  /// dismiss button text color
  final Color? dismissTextColor;

  ///  dismiss button text
  final String? dismissText;

  ///  day text of both from to time  picker
  ///
  /// by default it must be 'AM'
  ///
  /// pass any text you want to localize it
  final String? dayText;

  /// the night text of both from to time picker
  ///
  /// by default it must be 'PM'
  ///
  /// pass any text you want to localize it
  final String? nightText;

  /// the default viewed text in time picker
  ///
  /// by default it contains '00'
  final String? timeHintText;

  /// the text above the first time picker
  final String? fromHeadline;

  /// the text above second time picker
  final String? toHeadline;

  /// color of text above the first time picker
  final Color? fromHeadlineColor;

  /// color of text above the first time picker
  final Color? toHeadlineColor;

  /// background color of Active 'AM','PM' box
  final Color? activeDayNightColor;

  /// background color of deactivated 'AM','PM' box
  final Color? defaultDayNightColor;

  /// text color of Active 'AM','PM' box
  final Color? activeDayNightTextColor;

  /// text color of deactivated 'AM','PM' box
  final Color? defaultDayNightTextColor;

  ///border radius of 'AM','PM' box
  final double? dayNightBorderRadius;

  ///border radius of time picker
  final double? timeBoxBorderRadius;

  /// background color of time picker
  final Color? timeBoxColor;

  /// background color of the dialog
  final Color? dialogBackgroundColor;

  /// icon of increasing time button
  final IconData? upIcon;

  /// icon of decreasing time button
  final IconData? downIcon;

  /// icon color of increasing time button
  final Color? upIconColor;

  /// icon color of decreasing time button
  final Color? downIconColor;

  /// color of the vertical divider between 'increasing and decreasing buttons' and 'the time text'
  final Color? dividerColor;

  /// color of default shown text in time box
  final Color? timeHintColor;

  /// color of picked hour text
  final Color? timeTextColor;

  /// show circular bullet before the dialog header
  ///
  /// can be used to show available or unavailable time to user
  final bool? showHeaderBullet;

  ///color of circular bullet before the dialog header
  ///
  /// for best practice use green color for available and red for unavailable time
  final Color? headerBulletColor;

  /// color of two dots separates between two time picker box
  final Color? colonColor;

  const FromToTimePicker(
      {Key? key,
        required this.onTab,
        this.headerText,
        this.fromHeadline = 'From',
        this.toHeadline = 'To',
        this.fromHeadlineColor = MColors.black,
        this.toHeadlineColor = MColors.black,
        this.activeDayNightColor = MColors.primary_color,
        this.defaultDayNightColor = MColors.mainColor70,
        this.activeDayNightTextColor = MColors.white,
        this.defaultDayNightTextColor = MColors.black,
        this.dayNightBorderRadius = 5,
        this.timeBoxBorderRadius = 8,
        this.timeBoxColor = MColors.mainColor70,
        this.upIcon = Icons.keyboard_arrow_up_rounded,
        this.downIcon = Icons.keyboard_arrow_down_rounded,
        this.upIconColor = MColors.black,
        this.downIconColor = MColors.black,
        this.dividerColor = MColors.divider,
        this.timeHintColor = MColors.divider,
        this.timeTextColor = MColors.gray_66,
        this.doneText = 'ok',
        this.dismissText = 'cancel',
        this.dayText = 'AM',
        this.nightText = 'PM',
        this.dialogBackgroundColor = MColors.white,
        this.showHeaderBullet = false,
        this.headerBulletColor = MColors.green_1,
        this.headerTextColor = MColors.gray_9a,
        this.colonColor = MColors.black,
        this.timeHintText = '00',
        this.doneTextColor = MColors.black,
        this.dismissTextColor = MColors.black})
      : super(key: key);

  @override
  State<FromToTimePicker> createState() => _FromToTimePickerState();
}

class _FromToTimePickerState extends State<FromToTimePicker> {
  bool isAmFrom = false, isAmTo = false;
  int timePickerStartTime = 0, timePickerEndTime =11;
  late TimeOfDay fromTime;
  late TimeOfDay toTime;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            height: widget.headerText != null
                ? MediaQuery.of(context).size.height *
                (isNotMobile() ? 0.33 : 0.26)
                : MediaQuery.of(context).size.height * .24,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: widget.dialogBackgroundColor,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: widget.headerText != null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: widget.showHeaderBullet!,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .03,
                          height: MediaQuery.of(context).size.width * .03,
                          margin: EdgeInsetsDirectional.only(
                              end: MediaQuery.of(context).size.width * .02),
                          decoration: BoxDecoration(
                              color: widget.headerBulletColor,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * .04)),
                        ),
                      ),
                      Text(
                        '${widget.headerText}',
                        style: TextStyle(
                            fontSize: 12, color: widget.headerTextColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          fromTimeItem(widget.fromHeadline!),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          Container(
                            padding: EdgeInsetsDirectional.only(
                                top: MediaQuery.of(context).size.height * .02),
                            height: MediaQuery.of(context).size.height * .12,
                            alignment: Alignment.center,
                            child: Text(
                              ':',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: widget.colonColor),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          toTimeItem(widget.toHeadline!)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
              end: 20,
              bottom: 10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        widget.dismissText!,
                        style: TextStyle(
                            color: widget.dismissTextColor, fontSize: 16),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .06,
                  ),
                  InkWell(
                      onTap: () {
                        widget.onTab!(
                            generate24HTime(
                                isAmFrom, timePickerStartTime.toString()),
                            generate24HTime(
                                isAmTo, timePickerEndTime.toString()));
                        Navigator.pop(context);
                      },
                      child: Text(
                        widget.doneText!,
                        style: TextStyle(
                            color: widget.doneTextColor, fontSize: 16),
                      )),
                ],
              ))
        ],
      ),
    );
  }

  /// the from time part of the dialog
  ///
  /// contains two arrows, day night box, and time box
  Widget fromTimeItem(String headline) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          headline,
          style: TextStyle(
              color: widget.fromHeadlineColor, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fromTimePicker(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .02,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isAmFrom = false;
                      fromTime = generate24HTime(
                          isAmFrom, timePickerStartTime.toString());
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .07,
                    height: MediaQuery.of(context).size.height * .038,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        widget.dayText!,
                        style: TextStyle(
                            color: isAmFrom
                                ? widget.activeDayNightTextColor
                                : widget.defaultDayNightTextColor,
                            fontSize: 10),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: isAmFrom == true
                            ? widget.activeDayNightColor
                            : widget.defaultDayNightColor,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart:
                            Radius.circular(widget.dayNightBorderRadius!),
                            topEnd:
                            Radius.circular(widget.dayNightBorderRadius!))),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .005,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isAmFrom = false;
                      fromTime = generate24HTime(
                          isAmFrom, timePickerStartTime.toString());
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .07,
                    height: MediaQuery.of(context).size.height * .038,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        widget.nightText!,
                        style: TextStyle(
                            color: isAmFrom
                                ? widget.defaultDayNightTextColor
                                : widget.activeDayNightTextColor,
                            fontSize: 10),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: isAmFrom == true
                            ? widget.defaultDayNightColor
                            : widget.activeDayNightColor,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomEnd:
                            Radius.circular(widget.dayNightBorderRadius!),
                            bottomStart:
                            Radius.circular(widget.dayNightBorderRadius!))),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  /// the to time part of the dialog
  ///
  /// contains two arrows, day night box, and time box
  Widget toTimeItem(String headline) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        /*Text(
          headline,
          style: TextStyle(
              color: widget.toHeadlineColor, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),*/
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            toTimePicker(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .02,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isAmTo = true;
                      toTime =
                          generate24HTime(isAmTo, timePickerEndTime.toString());
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .07,
                    height: MediaQuery.of(context).size.height * .038,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        widget.dayText!,
                        style: TextStyle(
                            color: isAmTo
                                ? widget.activeDayNightTextColor
                                : widget.defaultDayNightTextColor,
                            fontSize: 10),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: isAmTo == true
                            ? widget.activeDayNightColor
                            : widget.defaultDayNightColor,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart:
                            Radius.circular(widget.dayNightBorderRadius!),
                            topEnd:
                            Radius.circular(widget.dayNightBorderRadius!))),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .005,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isAmTo = false;
                      toTime =
                          generate24HTime(isAmTo, timePickerEndTime.toString());
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .07,
                    height: MediaQuery.of(context).size.height * .038,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        widget.nightText!,
                        style: TextStyle(
                            color: isAmTo
                                ? widget.defaultDayNightTextColor
                                : widget.activeDayNightTextColor,
                            fontSize: 10),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: isAmTo == true
                            ? widget.defaultDayNightColor
                            : widget.activeDayNightColor,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomEnd:
                            Radius.circular(widget.dayNightBorderRadius!),
                            bottomStart:
                            Radius.circular(widget.dayNightBorderRadius!))),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  /// from time box that contain arrows and picked hour text
  Widget fromTimePicker() {
    return Container(
      width: MediaQuery.of(context).size.width * .20,
      height: MediaQuery.of(context).size.height * .08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.timeBoxBorderRadius!),
        color: widget.timeBoxColor,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width * .01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: MColors.primary_color.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        if (timePickerStartTime < 12) {
                          setState(() {
                            timePickerStartTime++;
                            fromTime = generate24HTime(
                                isAmFrom, timePickerStartTime.toString());
                          });
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .06,
                        child: Icon(
                          widget.upIcon,
                          color: widget.upIconColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .01),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: MColors.primary_color.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        if (timePickerStartTime > 1) {
                          setState(() {
                            timePickerStartTime--;
                            fromTime = generate24HTime(
                                isAmFrom, timePickerStartTime.toString());
                          });
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .06,
                        child: Icon(
                          widget.downIcon,
                          color: widget.downIconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              indent: 2,
              color: widget.dividerColor,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .10,
              alignment: Alignment.center,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                    timePickerStartTime == 0
                        ? widget.timeHintText!
                        : timePickerStartTime.toString(),
                    key: ValueKey<String>(timePickerStartTime.toString()),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: timePickerStartTime == 0
                            ? widget.timeHintColor
                            : widget.timeTextColor)),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// to time box that contain arrows and picked hour text
  Widget toTimePicker() {
    return Container(
      width: MediaQuery.of(context).size.width * .20,
      height: MediaQuery.of(context).size.height * .09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.timeBoxBorderRadius!),
        color: widget.timeBoxColor,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width * .01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: MColors.primary_color.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        if (timePickerEndTime < 11) {
                          setState(() {
                            timePickerEndTime++;
                            toTime = generate24HTime(
                                isAmTo, timePickerEndTime.toString());
                          });
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .06,
                        child: Icon(
                          widget.upIcon,
                          color: widget.upIconColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .01),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: MColors.primary_color.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        if (timePickerEndTime > 4) {
                          setState(() {
                            timePickerEndTime--;
                            toTime = generate24HTime(
                                isAmTo, timePickerEndTime.toString());
                          });
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .06,
                        child: Icon(
                          widget.downIcon,
                          color: widget.downIconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              indent: 2,
              color: widget.dividerColor,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
            Container(
                width: MediaQuery.of(context).size.width * .10,
                alignment: Alignment.center,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Text(
                    timePickerEndTime == 0
                        ? widget.timeHintText!
                        : timePickerEndTime.toString(),
                    key: ValueKey<String>(timePickerEndTime.toString()),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: timePickerEndTime == 0
                            ? widget.timeHintColor
                            : widget.timeTextColor),
                  ),
                ),),
          ],
        ),
      ),
    );
  }

  ///convert time from 12h to 24h format
  TimeOfDay generate24HTime(bool isAm, String hour) {
    initializeDateFormatting();
    DateTime date =
    DateFormat("hh:mma", 'en').parse("$hour:00${isAm ? 'AM' : 'PM'}");

    return TimeOfDay.fromDateTime(date);
  }

  ///check platform
  bool isNotMobile() {
    return defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows;
  }
}



class MColors {
  static const page_dark_background = Color(0xFF121212);
  static const second_dark_color = Color(0xFF1E1E1E);
  static const text_dark_color = Color(0xFFE1E1E1);
  static const text2_dark_color = Color(0xFF9F9F9F);
  static const loginColor2 = Color(0xff7A1336);
  static const loginColor1 = Color(0xff561435);

  static const primary_color = Color(0xFFa6264c);

  static const primary_light_color = const Color(0xffFFA873);

  static const secondary_light_color = const Color(0xffA079EC);

  static const secondary_dark_color = const Color(0xff5554DB);

  static const page_background = const Color(0xfff6f6f6);

  static const facebook_color = const Color(0xff345287);

  static const font_color = const Color(0xff433669);

  static const back_button_color = const Color(0xffA0A2B3);

  static const hint_color = const Color(0xffA59fB7);

  static const badge_color = const Color(0xffCC0000);

  static const transparent_white_color = const Color(0x55A0A2B3);
  static const transparent_white_color_70 = const Color(0Xaaffffff);

  static const transparent_primary_color = const Color(0x15129A7F);

  static const off_white = const Color(0xffF5F5F5);

  static const main_text_color = const Color(0xff777A95);

  static const main_bg_color = const Color(0xffF6F6F6);

  static const border_color = const Color(0xffAAABAB);

  // static const Color teacher_main_color = Color(0xff2051A5);
  // static const Color primary_color = Color(0xFF129A7F);

  static const Color lightGreen = Color(0xFF12c07f);

  static const Color darkGrey = Color(0xFF848B92);
  static const Color dividerColor = Color(0xFF414141);
  static const Color gray = Color(0xFFE7E8EA);
  static const Color gold = Color(0xFFdebc29);
  static const Color starColor2 = Color(0x66e7bb4e);
  static const Color mainColor50 = Color(0x225C1349);
  static const Color mainColor70 = Color(0x105C1349);
  static const lightBlack = Color(0xff171717);
  static const Color lucid = Color(0xFFF9FFFF);

  static const Color corn_flower = Color(0xffddfeff);

  static const Color porcelain = Color(0xFFF6F7F8);

  static const Color arrow = Color(0xffCED2D7);

  static const Color transparent_80 = Color(0x80000000);
  static const Color black = Color(0xFF000000);

  static const Color transparent_60 = Color(0xCC000000);

  static const Color dart_light_color = Color(0x26000000);

  static const Color dart_red = Color(0xFFD1295C);
  static const Color dark_red = Color(0xFF8b0000);

  static const Color tabsTextColor = Color(0xFF848B92);

  static const Color text_dark = Color(0xFF333333);
  static const Color text_normal = Color(0xFF666666);
  static const Color text_gray = Color(0xFF999999);
  static const Color app_bar_gray = Color(0x996d7278);
  static const Color white_line = Color(0xFFAAAAAA);
  static const Color dark_44 = Color(0x44000000);
  static const Color white_dd = Color(0xFFdddddd);

  static const Color trans_banner_text = Color(0xCCFFFFFF);
  static const Color trans_banner_bg = Color(0x33000000);

  static const Color divider = Color(0xffe5e5e5);

  static const Color textColor = Color(0xffAAABAB);

  static const Color gray_33 = Color(0xFF333333); //51
  static const Color gray_66 = Color(0xFF666666); //102
  static const Color gray_99 = Color(0xFF999999); //153
  static const Color gray_aa = Color(0xFFaaaaaa); //153
  static const Color common_orange = Color(0XFFFC9153); //252 145 83
  static const Color gray_ef = Color(0XFFEFEFEF); //153
  static const Color gray_9a = Color(0XFF9A9A9A);

  static const Color gray_f0 = Color(0xfff0f0f0); //<!--204-->
  static const Color gray_f5 = Color(0xfff5f5f5); //<!--204-->
  static const Color gray_cc = Color(0xffcccccc); //<!--204-->
  static const Color gray_ce = Color(0xffcecece); //<!--206-->
  static const Color green_1 = Color(0xff009688); //<!--204-->
  static const Color green_62 = Color(0xff626262); //<!--204-->
  static const Color green_e5 = Color(0xffe5e5e5); //<!--204-->

  static const Color gray_ee = Color(0xFFEEEEEE);

  static const darkGreyBlue = const Color(0xff344356);
  static const darkBlueGrey12 = const Color(0x1d1f314a);
  static const coolGrey = const Color(0xff8a959e);
  static const white = const Color(0xffffffff);
  static const windowsBlue9 = const Color(0x163c80d1);

  Map<String, Color> circleAvatarMap = {
    'A': Colors.blueAccent,
    'B': Colors.blue,
    'C': Colors.cyan,
    'D': Colors.deepPurple,
    'E': Colors.deepPurpleAccent,
    'F': Colors.blue,
    'G': Colors.green,
    'H': Colors.lightBlue,
    'I': Colors.indigo,
    'J': Colors.blue,
    'K': Colors.blue,
    'L': Colors.lightGreen,
    'M': Colors.blue,
    'N': Colors.brown,
    'O': Colors.orange,
    'P': Colors.purple,
    'Q': Colors.black,
    'R': Colors.red,
    'S': Colors.blue,
    'T': Colors.teal,
    'U': Colors.purpleAccent,
    'V': Colors.black,
    'W': Colors.brown,
    'X': Colors.blue,
    'Y': Colors.yellow,
    'Z': Colors.grey,
    '#': Colors.blue,
  };

  Map<String, Color> themeColorMap = {
    'gray': MColors.gray_33,
    'blue': Colors.blue,
    'blueAccent': Colors.blueAccent,
    'cyan': Colors.cyan,
    'deepPurple': Colors.deepPurple,
    'deepPurpleAccent': Colors.deepPurpleAccent,
    'deepOrange': Colors.deepOrange,
    'green': Colors.green,
    'indigo': Colors.indigo,
    'indigoAccent': Colors.indigoAccent,
    'orange': Colors.orange,
    'purple': Colors.purple,
    'pink': Colors.pink,
    'red': Colors.red,
    'teal': Colors.teal,
    'black': Colors.black,
  };

  static const Map<int, Color> GatesColorMap = {
    0: Color(0xff77ea5a),
    1: Color(0xff2051a5),
    2: Color(0xff01b6f3),
    3: Color(0xff009245),
    4: Color(0xffe3ea5a),
    5: Colors.blue,
    6: Colors.orange,
  };
/**
 *
    0: Colors.pink,
    1: Colors.deepPurple,
    2: Colors.deepOrange,
    3: Colors.green,
    4: Colors.indigo,
    5: Colors.orange,
    6: Colors.pink,

 */
}

