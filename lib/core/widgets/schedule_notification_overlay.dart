import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/core/services/app_navigation.dart';
import 'package:flutter/material.dart';

class ScheduleNotificationOverlay {
  static OverlayEntry? _entry;

  static void show({
    required String title,
    required String body,
    DateTime? createdAt,
    VoidCallback? onYes,
    VoidCallback? onNo,
  }) {
    final overlay = AppNavigation.navigatorKey.currentState?.overlay;

    if (overlay == null) return;

    _entry?.remove();
    _entry = null;

    _entry = OverlayEntry(
      builder: (context) {
        return _AnimatedScheduleNotification(
          title: title,
          body: body,
          createdAt: createdAt,

          // YES = ACCEPT
          onYes: () {
            onYes?.call();

            _entry?.remove();
            _entry = null;
          },

          // NO = REJECT
          onNo: () {
            onNo?.call();

            _entry?.remove();
            _entry = null;
          },

          onDismiss: () {
            _entry?.remove();
            _entry = null;
          },
        );
      },
    );

    overlay.insert(_entry!);
  }
}

class _AnimatedScheduleNotification extends StatefulWidget {
  final String title;
  final String body;
  final DateTime? createdAt;

  final VoidCallback onYes;
  final VoidCallback onNo;
  final VoidCallback onDismiss;

  const _AnimatedScheduleNotification({
    super.key,
    required this.title,
    required this.body,
    required this.onYes,
    required this.onNo,
    required this.onDismiss,
    this.createdAt,
  });

  @override
  State<_AnimatedScheduleNotification> createState() =>
      _AnimatedScheduleNotificationState();
}

class _AnimatedScheduleNotificationState
    extends State<_AnimatedScheduleNotification>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  bool _isActionPressed = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 8), () async {
      if (!mounted || _isActionPressed) return;

      await _controller.reverse();

      if (mounted && !_isActionPressed) {
        widget.onDismiss();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleYes() {
    if (_isActionPressed) return;

    _isActionPressed = true;

    widget.onYes();
  }

  void _handleNo() {
    if (_isActionPressed) return;

    _isActionPressed = true;

    widget.onNo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Material(
                  color: Colors.transparent,
                  child: _buildCard(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(blurRadius: 18, color: Colors.black.withOpacity(0.12)),
        ],
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.calendar_month_rounded,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.body,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _isActionPressed ? null : _handleNo,
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: theme.colorScheme.primary.withOpacity(0.25),
                    ),
                  ),
                  child: const Text(
                    'NO',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: _isActionPressed ? null : _handleYes,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(42),
                    backgroundColor: greenColor,
                    foregroundColor: theme.colorScheme.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'YES',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
