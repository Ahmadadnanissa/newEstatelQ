import 'package:flutter/material.dart';

/// Wrap editable feature content to prevent accidental navigation loss.
class UnsavedChangesGuard extends StatelessWidget {
  const UnsavedChangesGuard({super.key, required this.hasUnsavedChanges, required this.child});
  final bool hasUnsavedChanges;
  final Widget child;
  @override
  Widget build(BuildContext context) => PopScope(
    canPop: !hasUnsavedChanges,
    onPopInvokedWithResult: (didPop, _) async {
      if (didPop || !hasUnsavedChanges) return;
      final discard = await showDialog<bool>(context: context, builder: (dialog) => AlertDialog(
        title: const Text('Discard unsaved changes?'), content: const Text('Your pending edits will be lost.'),
        actions: [TextButton(onPressed: () => Navigator.pop(dialog, false), child: const Text('Keep editing')), FilledButton(onPressed: () => Navigator.pop(dialog, true), child: const Text('Discard'))],
      ));
      if (discard == true && context.mounted) Navigator.of(context).pop();
    },
    child: child,
  );
}
