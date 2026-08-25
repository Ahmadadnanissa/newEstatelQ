import 'package:estatelqapp/core/services/notification_prompt_local_storage_service.dart';
import 'package:estatelqapp/core/services/visitor_local_storage_services.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/lead_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPersonalizationDialog extends StatelessWidget {
  const NotificationPersonalizationDialog({super.key});

  static Future<void> show(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return const NotificationPersonalizationDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Dialog(
      backgroundColor:
          theme.dialogTheme.backgroundColor ?? theme.scaffoldBackgroundColor,
      elevation: 8,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 26, 24, 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.10),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_active_rounded,
                size: 34,
                color: colorScheme.primary,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Get More Personalized Updates',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Would you like to receive more notifications '
              'tailored to your interests and preferences?',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.5,
                color: theme.textTheme.bodyMedium?.color?.withOpacity(0.75),
              ),
            ),

            const SizedBox(height: 26),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () async {
                  final leadProvider = context.read<LeadProvider>();

                  final visitorSessionId =
                      VisitorLocalStorageService.getVisitorId();

                  if (visitorSessionId == null || visitorSessionId.isEmpty) {
                    return;
                  }

                  await leadProvider.createLead(visitorSessionId);

                  if (leadProvider.error != null) {
                    return;
                  }

                  await NotificationPromptLocalStorageService.saveAccepted();

                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text(
                  'Yes, Keep Me Updated',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                onPressed: () async {
                  await NotificationPromptLocalStorageService.saveLastShownAt();

                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: theme.textTheme.bodyMedium?.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Not Now',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
