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
    this.onChanged1,
    this.onChanged2,
    required this.icon1,
    required this.icon2,
    required this.obsecureText1,
    required this.obsecureText2,
    this.controller1,
    this.controller2,
  });

  TextEditingController? controller1;
  TextEditingController? controller2;

  bool obsecureText1;
  bool obsecureText2;

  String text1, text2;

  Function(String)? onChanged1, onChanged2;

  String? Function(String?) validator1, validator2;

  Widget icon1, icon2;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color fieldColor = Theme.of(context).cardColor;

    final Color borderColor = isDark
        ? darkSurfaceColor
        : const Color(0xffE5F0F4);

    final Color hintColor = isDark
        ? darkSubtitleColor
        : const Color(0xff5F6264);

    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.05,
        right: width * 0.05,
        top: width * 0.03,
      ),
      child: Column(
        children: [
          // ================= FIRST FIELD =================
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.15)
                      : Colors.black.withValues(alpha: 0.08),
                  offset: const Offset(0, 3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: TextFormField(
              controller: controller1,
              obscureText: obsecureText1,
              validator: validator1,
              onChanged: onChanged1,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: fontFamily,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),

                // ================= COLORS =================
                fillColor: fieldColor,
                filled: true,

                // ================= ICON =================
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

                // ================= HINT =================
                hintText: text1,

                hintStyle: TextStyle(
                  color: hintColor,
                  fontFamily: fontFamily,
                  fontSize: width * 0.04,
                ),

                // ================= BORDERS =================
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: borderColor, width: 1),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: borderColor, width: 1),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: borderColor, width: 1),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: borderColor, width: 1),
                ),
              ),
            ),
          ),

          // ================= SECOND FIELD =================
          Padding(
            padding: EdgeInsets.only(top: width * 0.03),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.15)
                        : Colors.black.withValues(alpha: 0.08),
                    offset: const Offset(0, 3),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: TextFormField(
                controller: controller2,
                obscureText: obsecureText2,
                validator: validator2,
                onChanged: onChanged2,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontFamily: fontFamily,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),

                  // ================= COLORS =================
                  fillColor: fieldColor,
                  filled: true,

                  // ================= ICON =================
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

                  // ================= HINT =================
                  hintText: text2,

                  hintStyle: TextStyle(
                    color: hintColor,
                    fontFamily: fontFamily,
                    fontSize: width * 0.04,
                  ),

                  // ================= BORDERS =================
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: borderColor, width: 1),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: borderColor, width: 1),
                  ),

                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: borderColor, width: 1),
                  ),

                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: borderColor, width: 1),
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
