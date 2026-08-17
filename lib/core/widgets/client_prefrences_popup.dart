import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/widgets/second_price_range.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/home_page.dart';
import 'package:estatelqapp/features/menu_feature/presentation/widgets/custom_text_form_field_for_string.dart';
import 'package:flutter/material.dart';

class ClientPreferencesPopup extends StatefulWidget {
  const ClientPreferencesPopup({super.key, required this.onConfirm});

  final void Function({
    required String minPrice,
    required String maxPrice,
    required String source,
  })
  onConfirm;

  @override
  State<ClientPreferencesPopup> createState() => _ClientPreferencesPopupState();
}

class _ClientPreferencesPopupState extends State<ClientPreferencesPopup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _minPriceController = TextEditingController();

  final TextEditingController _maxPriceController = TextEditingController();

  final TextEditingController _sourceController = TextEditingController();

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    _sourceController.dispose();
    super.dispose();
  }

  void _confirm() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    widget.onConfirm(
      minPrice: _minPriceController.text.trim(),
      maxPrice: _maxPriceController.text.trim(),
      source: _sourceController.text.trim(),
    );

    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: width * 0.125,
        vertical: height * 0.125,
      ),
      child: Container(
        width: width * 0.75,
        height: height * 0.75,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isDark
                ? darkSurfaceColor
                : greenColor.withValues(alpha: 0.35),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.12),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // ================= HEADER =================
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.025,
                    top: width * 0.025,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Your Preferences',
                          style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: width * 0.052,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, HomePage.id);
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          size: width * 0.065,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 1,
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.15),
                ),

                // ================= CONTENT =================
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.025,
                      vertical: width * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ================= PRICE =================
                        Text(
                          'What is your budget?',
                          style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: width * 0.038,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),

                        SizedBox(height: width * 0.01),

                        Text(
                          'Choose the minimum and maximum price you are comfortable with.',
                          style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: width * 0.029,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.55),
                          ),
                        ),

                        SizedBox(height: width * 0.015),

                        SecondPriceRaange(
                          minController: _minPriceController,
                          maxController: _maxPriceController,
                        ),

                        // ================= SOURCE =================
                        SizedBox(height: width * 0.015),

                        Text(
                          'How did you find us?',
                          style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: width * 0.038,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),

                        SizedBox(height: width * 0.01),

                        Text(
                          'Tell us where you heard about us.',
                          style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: width * 0.029,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.55),
                          ),
                        ),

                        SizedBox(height: width * 0.025),

                        CustomTextFormFieldForString(
                          controller: _sourceController,
                          hintText: 'Facebook, Instagram, Google...',
                          icon: const Icon(Icons.campaign_outlined),
                          onChanged: (_) {},
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter how you found us';
                            }

                            return null;
                          },
                        ),

                        SizedBox(height: width * 0.08),
                      ],
                    ),
                  ),
                ),

                // ================= CONFIRM =================
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    width * 0.05,
                    width * 0.02,
                    width * 0.05,
                    width * 0.045,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: width * 0.12,
                    child: ElevatedButton(
                      onPressed: _confirm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        foregroundColor: primaryColor,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
