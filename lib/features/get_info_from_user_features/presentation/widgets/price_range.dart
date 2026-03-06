import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class PriceRaange extends StatefulWidget {
  const PriceRaange({super.key});

  @override
  State<PriceRaange> createState() => _PriceRaangeState();
}

class _PriceRaangeState extends State<PriceRaange> {
  RangeValues values = const RangeValues(5000, 15000);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.04,
        horizontal: width * 0.05,
      ),

      child: Container(
        padding: EdgeInsets.all(width * 0.04),

        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greenColor, width: 1),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(
              "Price Range",
              style: TextStyle(
                fontFamily: fontFamily,
                fontSize: width * 0.04,
                color: secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: width * 0.03),

            /// Price boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: width * 0.02,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: secondaryColor),
                  ),
                  child: Text(
                    "\$${values.start.round()}",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: width * 0.035,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: width * 0.02,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: secondaryColor),
                  ),
                  child: Text(
                    "\$${values.end.round()}",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: width * 0.035,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: width * 0.02),

            /// Range Slider
            RangeSlider(
              values: values,

              min: 5000,
              max: 50000,

              divisions: 45,

              activeColor: secondaryColor,
              inactiveColor: secondaryColor.withOpacity(0.3),

              labels: RangeLabels(
                values.start.round().toString(),
                values.end.round().toString(),
              ),

              onChanged: (RangeValues newValues) {
                setState(() {
                  values = newValues;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
