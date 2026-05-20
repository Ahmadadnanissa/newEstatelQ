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
                  width: width * .28,
                  padding: EdgeInsets.symmetric(vertical: width * .025),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "\$${values.start.round()}",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: width * .04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Container(
                  width: width * .28,
                  padding: EdgeInsets.symmetric(vertical: width * .025),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "\$${values.end.round()}",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: width * .04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: width * .03),

            RangeSlider(
              values: values,

              min: 5000,

              max: 50000,

              divisions: 45,

              activeColor: secondaryColor,

              inactiveColor: secondaryColor.withOpacity(.3),

              onChanged: (RangeValues newValues) {
                setState(() {
                  values = newValues;
                });

                widget.minController?.text = newValues.start.round().toString();

                widget.maxController?.text = newValues.end.round().toString();
              },
            ),
          ],
        ),
      ),
    );
  }
}
