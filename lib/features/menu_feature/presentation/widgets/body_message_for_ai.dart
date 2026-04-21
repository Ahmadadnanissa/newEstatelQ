import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class BodyMeesageForAi extends StatelessWidget {
  const BodyMeesageForAi({
    super.key,
    required this.isUserMessage,
    required this.message,
  });
  final bool isUserMessage;
  final String message;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.01,
        horizontal: width * 0.04,
      ),
      child: Row(
        mainAxisAlignment: isUserMessage
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: width * 0.5),
            decoration: BoxDecoration(
              color: isUserMessage ? Color(0xffEDF6F9) : secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(width * 0.06),
                topRight: Radius.circular(width * 0.06),
                bottomLeft: isUserMessage
                    ? Radius.circular(width * 0.06)
                    : Radius.circular(0),
                bottomRight: isUserMessage
                    ? Radius.circular(0)
                    : Radius.circular(width * 0.06),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                message,
                textAlign: TextAlign.start,

                style: TextStyle(
                  color: blackColor,
                  fontSize: width * 0.035,
                  fontFamily: fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
