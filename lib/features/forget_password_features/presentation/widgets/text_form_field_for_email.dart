import 'package:estatelqapp/core/app_theme.dart';
import 'package:flutter/material.dart';

class TextFormFieldForEmail extends StatefulWidget {
  const TextFormFieldForEmail({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  State<TextFormFieldForEmail> createState() => _TextFormFieldForEmailState();
}

class _TextFormFieldForEmailState extends State<TextFormFieldForEmail> {
  String? email;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color borderColor = isDark
        ? darkSurfaceColor
        : const Color(0xffE5F0F4);

    final Color hintColor = isDark
        ? darkSubtitleColor
        : const Color(0xff5F6264);

    return Padding(
      padding: EdgeInsets.only(
        top: width * 0.03,
        left: width * 0.05,
        right: width * 0.05,
      ),

      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.10 : 0.08),
              offset: const Offset(0, 3),
              blurRadius: 10,
            ),
          ],
        ),

        child: TextFormField(
          controller: widget.emailController,

          obscureText: false,

          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: fontFamily,
          ),

          validator: (data) {
            RegExp emailRegex = RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
            );

            if (data!.isEmpty || !emailRegex.hasMatch(data.trim())) {
              return 'Email not valid';
            }

            return null;
          },

          onChanged: (data) {
            email = data.trim();
          },

          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),

            fillColor: Theme.of(context).cardColor,

            filled: true,

            prefixIcon: Padding(
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.01),

              child: IconButton(
                onPressed: () {},

                icon: const Icon(Icons.email_outlined),

                color: secondaryColor,
              ),
            ),

            hintText: 'Enter Your Email',

            hintStyle: TextStyle(
              color: hintColor,
              fontFamily: fontFamily,
              fontSize: width * 0.04,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),

              borderSide: BorderSide(color: borderColor, width: 1),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),

              borderSide: BorderSide(color: secondaryColor, width: 1.2),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),

              borderSide: BorderSide(color: borderColor, width: 1),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),

              borderSide: BorderSide(color: secondaryColor, width: 1.2),
            ),
          ),
        ),
      ),
    );
  }
}
