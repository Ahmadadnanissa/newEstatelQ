import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/property_details_feature/presentation/providers/buy_request_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyRequestPopup extends StatefulWidget {
  const BuyRequestPopup({super.key, required this.propertyId});

  final String propertyId;

  @override
  State<BuyRequestPopup> createState() => _BuyRequestPopupState();
}

class _BuyRequestPopupState extends State<BuyRequestPopup> {
  final TextEditingController _messageController = TextEditingController();

  String _selectedType = 'BUY';

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendRequest() async {
    FocusScope.of(context).unfocus();

    final message = _messageController.text.trim().isEmpty
        ? 'I am interested in this property.'
        : _messageController.text.trim();

    final provider = context.read<BuyRequestProvider>();

    await provider.createBuyRequest(
      type: _selectedType,
      message: message,
      propertyId: widget.propertyId,
    );

    if (!mounted) return;

    if (provider.error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(provider.error!)));

      return;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: Container(
        padding: EdgeInsets.all(width * 0.055),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: greenColor.withValues(alpha: 0.25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.12),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Consumer<BuyRequestProvider>(
          builder: (context, provider, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================= HEADER =================
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Property Request',
                        style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: provider.isLoading
                          ? null
                          : () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close_rounded,
                        size: width * 0.06,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: width * 0.025),

                Text(
                  'What are you looking for?',
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: width * 0.034,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
                ),

                SizedBox(height: width * 0.025),

                // ================= BUY / RENT =================
                Row(
                  children: [
                    Expanded(
                      child: _RequestTypeButton(
                        title: 'Buy',
                        icon: Icons.home_outlined,
                        selected: _selectedType == 'BUY',
                        onTap: provider.isLoading
                            ? null
                            : () {
                                setState(() {
                                  _selectedType = 'BUY';
                                });
                              },
                      ),
                    ),

                    SizedBox(width: width * 0.025),

                    Expanded(
                      child: _RequestTypeButton(
                        title: 'Rent',
                        icon: Icons.key_outlined,
                        selected: _selectedType == 'RENT',
                        onTap: provider.isLoading
                            ? null
                            : () {
                                setState(() {
                                  _selectedType = 'RENT';
                                });
                              },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: width * 0.045),

                // ================= MESSAGE =================
                Text(
                  'Message',
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: width * 0.034,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
                ),

                SizedBox(height: width * 0.02),

                TextField(
                  controller: _messageController,
                  enabled: !provider.isLoading,
                  maxLines: 4,
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: width * 0.032,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  decoration: InputDecoration(
                    hintText: 'I am interested in this property...',
                    hintStyle: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: width * 0.03,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                    filled: true,
                    fillColor: Theme.of(
                      context,
                    ).colorScheme.surface.withValues(alpha: 0.5),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.03,
                        right: width * 0.015,
                        top: width * 0.025,
                      ),
                      child: Icon(
                        Icons.message_outlined,
                        size: width * 0.05,
                        color: secondaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.15),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.15),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: secondaryColor, width: 1.4),
                    ),
                  ),
                ),

                SizedBox(height: width * 0.05),

                // ================= SEND =================
                SizedBox(
                  width: double.infinity,
                  height: width * 0.12,
                  child: ElevatedButton(
                    onPressed: provider.isLoading ? null : _sendRequest,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      foregroundColor: primaryColor,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: provider.isLoading
                        ? SizedBox(
                            width: width * 0.05,
                            height: width * 0.05,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2.2,
                            ),
                          )
                        : Text(
                            'Send Request',
                            style: TextStyle(
                              fontFamily: fontFamily,
                              fontSize: width * 0.034,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _RequestTypeButton extends StatelessWidget {
  const _RequestTypeButton({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: width * 0.035),
        decoration: BoxDecoration(
          color: selected
              ? secondaryColor.withValues(alpha: 0.1)
              : Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? secondaryColor
                : Theme.of(context).colorScheme.outline.withValues(alpha: 0.15),
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: width * 0.06,
              color: selected
                  ? secondaryColor
                  : Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.55),
            ),

            SizedBox(height: width * 0.012),

            Text(
              title,
              style: TextStyle(
                fontFamily: fontFamily,
                fontSize: width * 0.031,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected
                    ? secondaryColor
                    : Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
