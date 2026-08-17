import 'package:flutter/material.dart';
import '../../domain/entities/hotspot.dart';

class HotspotMarker extends StatefulWidget {
  const HotspotMarker({
    super.key,
    required this.hotspot,
    required this.onTap,
    this.isSelected = false,
  });
  
  final TourHotspot hotspot;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  State<HotspotMarker> createState() => _HotspotMarkerState();
}

class _HotspotMarkerState extends State<HotspotMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: widget.isSelected ? _scaleAnimation.value : _pulseAnimation.value,
            child: child,
          );
        },
        child: _buildMarker(),
      ),
    );
  }

  Widget _buildMarker() {
    switch (widget.hotspot.type) {
      case HotspotType.navigation:
        return _NavigationMarker(
          label: widget.hotspot.label,
          isEnabled: widget.hotspot.isEnabled,
          isSelected: widget.isSelected,
        );
      case HotspotType.information:
        return _InformationMarker(
          label: widget.hotspot.label,
          isEnabled: widget.hotspot.isEnabled,
          isSelected: widget.isSelected,
        );
    }
  }
}

class _NavigationMarker extends StatelessWidget {
  const _NavigationMarker({
    required this.label,
    required this.isEnabled,
    required this.isSelected,
  });

  final String? label;
  final bool isEnabled;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = isEnabled
        ? (isSelected ? Colors.amber : Colors.blue)
        : Colors.grey;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.9),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.5),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}

class _InformationMarker extends StatelessWidget {
  const _InformationMarker({
    required this.label,
    required this.isEnabled,
    required this.isSelected,
  });

  final String? label;
  final bool isEnabled;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = isEnabled
        ? (isSelected ? Colors.amber : Colors.green)
        : Colors.grey;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.9),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.5),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Icon(
          Icons.info_outline,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
