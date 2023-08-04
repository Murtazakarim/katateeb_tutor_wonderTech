
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:extended_phone_number_input/consts/strings_consts.dart';
import 'package:extended_phone_number_input/widgets/country_code_list.dart';
import 'package:extended_phone_number_input/models/country.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katateeb_tutor/appStyles/appColors.dart';
import 'package:katateeb_tutor/generated/assets.dart';

class PhoneNumberInput extends StatefulWidget {
  final PhoneNumberInputController? controller;
  final String? initialValue;
  final String? initialCountry;
  final List<String>? excludedCountries;
  final List<String>? includedCountries;
  final bool allowPickFromContacts;
  final Widget? pickContactIcon;
  double padding;
  final void Function(String)? onChanged;
  final String? hint;
  final bool showSelectedFlag;
  final InputBorder? border;
  final String locale;
  final String? searchHint;
  final bool allowSearch;
  GlobalKey offsetKey;
  final CountryListMode countryListMode;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final ContactsPickerPosition contactsPickerPosition;
  final String? errorText;
  PhoneNumberInput({
    Key? key,
    this.controller,
    required this.offsetKey,
    this.onChanged,
    this.initialValue,
    this.initialCountry,
    this.excludedCountries,
    this.allowPickFromContacts = true,
    this.pickContactIcon,
    this.includedCountries,
    this.hint,
    this.showSelectedFlag = true,
    this.border,
    this.locale = 'en',
    this.searchHint,
    this.allowSearch = true,
    this.countryListMode = CountryListMode.bottomSheet,
    this.enabledBorder,
    this.focusedBorder,
    this.contactsPickerPosition = ContactsPickerPosition.suffix,
    this.errorText, this.padding = 20,
  }) : super(key: key);

  @override
  _CountryCodePickerState createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<PhoneNumberInput> {
  late PhoneNumberInputController _phoneNumberInputController;
  late TextEditingController _phoneNumberTextFieldController;
  late Future _initFuture;
  Country? _selectedCountry;
  List<Country>? _countries;
  double bottom = -7;

  void getWidgetInfo() {
    final RenderBox renderBox = widget.offsetKey.currentContext?.findRenderObject() as RenderBox;
    widget.offsetKey.currentContext?.size;

    final Size size = renderBox.size;
    print('Size: ${size.width}, ${size.height}');

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    double y = renderBox.localToGlobal(Offset.zero).dy;
    print('Offset1: ${offset.dx}, ${offset.dy}');
    double spaceAvailable = _getAvailableSpace(y + renderBox.size.height);
    setState(() {
      //dropDownOffset = offset;
      if(spaceAvailable > 220){
        //todo: I will update height and key
        bottom = (-renderBox.size.height + renderBox.size.height) -(Get.height *0.003).toInt() ;
      }else{
        bottom = renderBox.size.height + 220;
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      getWidgetInfo();
    });
    if (widget.controller == null) {
      _phoneNumberInputController = PhoneNumberInputController(
        context,
      );
    } else {
      _phoneNumberInputController = widget.controller!;
    }
    _initFuture =  _init();
    _phoneNumberInputController.addListener(_refresh);
    _phoneNumberTextFieldController = TextEditingController();

    super.initState();
  }

  Future _init() async {
    await _phoneNumberInputController.init(
        initialCountryCode: widget.initialCountry,
        excludeCountries: widget.excludedCountries,
        includeCountries: widget.includedCountries,
        initialPhoneNumber: widget.initialValue,
        errorText: widget.errorText,
        locale: widget.locale);
    _countries = _phoneNumberInputController.getCountries;
  }

  void _refresh() {
    _phoneNumberTextFieldController.value = TextEditingValue(
        text: _phoneNumberInputController.phoneNumber,
        selection: TextSelection(
            baseOffset: _phoneNumberInputController.phoneNumber.length,
            extentOffset: _phoneNumberInputController.phoneNumber.length));

    setState(() {
      _selectedCountry = _phoneNumberInputController.selectedCountry;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_phoneNumberInputController.fullPhoneNumber);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initFuture,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextFormField(
                controller: _phoneNumberTextFieldController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                  FilteringTextInputFormatter.allow(kNumberRegex),
                ],
                onChanged: (v) {
                  _phoneNumberInputController.innerPhoneNumber = v;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: _phoneNumberInputController.validator,
                keyboardType: TextInputType.phone,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding:  EdgeInsets.all(widget.padding),
                  fillColor: Colors.white,
                  hintText: widget.hint,
                  border: widget.border,
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: GoogleFonts.almarai(
                    color: AppColors.lightGreyColor,
                  ),
                  counter: null,
                  filled: true,
                  enabledBorder: widget.enabledBorder,
                  focusedBorder: widget.focusedBorder,
                  suffixIcon:  const Image(image: Svg(Assets.imgPhoneIcon,size: Size(26, 26)),),
                  prefixIcon: Directionality(
                    textDirection: TextDirection.rtl,
                    child: SizedBox(
                      width: 130,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            height: 24,
                            width: 1,
                            color: const Color(0xFFB9BFC5),
                          ),
                          Expanded(
                            key:widget.offsetKey,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<Country>(
                                value: _selectedCountry,
                                // icon:  const Image(image: Svg(Assets.imgArrowDownWard,size: Size(12, 12))),
                                isExpanded: true,
                                iconStyleData: const IconStyleData(
                                  icon: Icon(Icons.keyboard_arrow_down,size: 24,color: AppColors.lightGreyColor),
                                  iconSize: 24,
                                  openMenuIcon: Icon(Icons.keyboard_arrow_left_outlined,size: 24,color: AppColors.primary),
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: AppColors.lightGreyColor),
                                    color: Colors.white,
                                    //color: AppColors.lightGreyColor,
                                  ),
                                  elevation: 0,
                                  direction: DropdownDirection.right,
                                  maxHeight: 220,
                                  offset: Offset(-1,bottom),
                                  /*scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),*/
                                ),
                                buttonStyleData: const ButtonStyleData(padding: EdgeInsets.all(0),),
                                onMenuStateChange: (isOpen){
                                  // setState(() {
                                  //   // _isOpen = isOpen;
                                  // });

                                },
                                // borderRadius: BorderRadius.circular(5),
                                //elevation: 0,
                                //dropdownColor: Colors.white,
                                style: GoogleFonts.almarai(fontSize: 16,color: AppColors.lightGreyColor),
                                items: _countries?.map((Country items) {
                                  return DropdownMenuItem<Country>(
                                    value: items,
                                    alignment: Alignment.centerRight,
                                    child: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          //const Icon(Icons.arrow_drop_down),
                                          //const Expanded(child: SizedBox()),
                                          Text(
                                            items.dialCode,
                                            style: TextStyle(
                                                color: Theme.of(context).primaryColor),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                            items.flagPath,
                                            width: 22,
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: (){},
                                  );
                                }).toList(),
                                onChanged: (Country? newValue) {
                                  setState(() {
                                    _selectedCountry = newValue;
                                    //dropDownValue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),

                ),
                textAlign: TextAlign.right,
              ),
            ),
          );
        });
  }

  void _openCountryList() {
    switch (widget.countryListMode) {
      case CountryListMode.bottomSheet:
        showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            enableDrag: true,
            context: context,
            builder: (_) => SizedBox(
              height: 500,
              child: CountryCodeList(
                  searchHint: widget.searchHint,
                  allowSearch: widget.allowSearch,
                  phoneNumberInputController: _phoneNumberInputController),
            ));
        break;
      case CountryListMode.dialog:
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: SizedBox(
                width: double.maxFinite,
                child: CountryCodeList(
                    searchHint: widget.searchHint,
                    allowSearch: widget.allowSearch,
                    phoneNumberInputController:
                    _phoneNumberInputController),
              ),
            ));
        break;
    }
  }
}
