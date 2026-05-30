import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class PriceRaange extends StatefulWidget {
  final TextEditingController? minController;
  final TextEditingController? maxController;

  const PriceRaange({super.key, this.minController, this.maxController});

  @override
  State<PriceRaange> createState() => _PriceRaangeState();
}

class _PriceRaangeState extends State<PriceRaange> {
  RangeValues values = const RangeValues(5000, 15000);

  @override
  void initState() {
    super.initState();

    widget.minController?.text = values.start.round().toString();

    widget.maxController?.text = values.end.round().toString();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.04,
        horizontal: width * 0.05,
      ),

      child: Container(
        padding: EdgeInsets.all(width * 0.04),

        decoration: BoxDecoration(
          // ================= BACKGROUND =================
          color: Theme.of(context).cardColor,

          borderRadius: BorderRadius.circular(18),

          // ================= BORDER =================
          border: Border.all(
            color: isDark
                ? darkSurfaceColor
                : greenColor.withValues(alpha: 0.5),
            width: 1,
          ),

          // ================= SHADOW =================
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.10 : 0.06),

              blurRadius: 10,

              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ================= TITLE =================
            Text(
              "Price Range",

              style: TextStyle(
                fontFamily: fontFamily,

                fontSize: width * 0.043,

                color: secondaryColor,

                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: width * 0.04),

            // ================= PRICE BOXES =================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                // ================= MIN =================
                Container(
                  width: width * .3,

                  padding: EdgeInsets.symmetric(vertical: width * .03),

                  decoration: BoxDecoration(
                    color: secondaryColor,

                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: Center(
                    child: Text(
                      "\$${values.start.round()}",

                      style: TextStyle(
                        color: primaryColor,

                        fontSize: width * .04,

                        fontWeight: FontWeight.bold,

                        fontFamily: fontFamily,
                      ),
                    ),
                  ),
                ),

                // ================= MAX =================
                Container(
                  width: width * .3,

                  padding: EdgeInsets.symmetric(vertical: width * .03),

                  decoration: BoxDecoration(
                    color: secondaryColor,

                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: Center(
                    child: Text(
                      "\$${values.end.round()}",

                      style: TextStyle(
                        color: primaryColor,

                        fontSize: width * .04,

                        fontWeight: FontWeight.bold,

                        fontFamily: fontFamily,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: width * .04),

            // ================= RANGE SLIDER =================
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4,

                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),

                overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),

                rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 8,
                ),
              ),

              child: RangeSlider(
                values: values,

                min: 5000,

                max: 50000,

                divisions: 45,

                activeColor: secondaryColor,

                inactiveColor: secondaryColor.withValues(alpha: 0.25),

                onChanged: (RangeValues newValues) {
                  setState(() {
                    values = newValues;
                  });

                  widget.minController?.text = newValues.start
                      .round()
                      .toString();

                  widget.maxController?.text = newValues.end.round().toString();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
