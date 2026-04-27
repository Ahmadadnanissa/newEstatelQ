import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/menu_feature/presentation/provider_state_managment/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFieldForSendMessage extends StatelessWidget {
  const CustomTextFieldForSendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Consumer<ChatProvider>(
        builder: (context, provider, child) {
          return Container(
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
              controller: provider.controller,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: width * 0.025,
                  horizontal: width * 0.05,
                ),
                fillColor: Color(0xffEDF6F9),
                filled: true,
                // prefixIcon: Padding(
                //   padding: EdgeInsets.only(left: width * 0.02, right: width * 0.01),
                // ),
                hintText: 'Write a Message',
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
          );
        },
      ),
    );
  }
}
