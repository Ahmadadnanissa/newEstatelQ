import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoubleTextFormfield extends StatelessWidget {
  DoubleTextFormfield({
    super.key,
    required this.text1,
    required this.text2,
    required this.validator1,
    required this.validator2,
    required this.onChanged1,
    required this.onChanged2,
    required this.icon1,
    required this.icon2,
    required this.obsecureText1,
    required this.obsecureText2,
  });
  bool obsecureText1;
  bool obsecureText2;
  String text1, text2;
  Function(String) onChanged1, onChanged2;
  String? Function(String?) validator1, validator2;
  Widget icon1, icon2;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.05,
        right: width * 0.05,
        top: width * 0.03,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  offset: Offset(0, 3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: TextFormField(
              obscureText: obsecureText1,
              validator: validator1,
              onChanged: onChanged1,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),
                fillColor: Color(0xffEDF6F9),
                filled: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.02,
                    right: width * 0.01,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: icon1,
                    color: secondaryColor,
                  ),
                ),
                hintText: text1,
                hintStyle: TextStyle(
                  color: Color(0xff5F6264),
                  fontFamily: fontFamily,
                  fontSize: width * 0.04,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.03),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withValues(alpha: 0.2),
                    offset: Offset(0, 3),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: TextFormField(
                obscureText: obsecureText2,
                validator: validator2,
                onChanged: onChanged2,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),
                  fillColor: Color(0xffEDF6F9),
                  filled: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.02,
                      right: width * 0.01,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: icon2,
                      color: secondaryColor,
                    ),
                  ),
                  hintText: text2,
                  hintStyle: TextStyle(
                    color: Color(0xff5F6264),
                    fontFamily: fontFamily,
                    fontSize: width * 0.04,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    borderSide: BorderSide(color: Color(0xffE5F0F4), width: 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
