import 'package:estatelqapp/core/services/visitor_local_storage.dart';
import 'package:flutter/material.dart';

class PropertyLikeButton extends StatefulWidget {
  final String propertyId;

  const PropertyLikeButton({super.key, required this.propertyId});

  @override
  State<PropertyLikeButton> createState() => _PropertyLikeButtonState();
}

class _PropertyLikeButtonState extends State<PropertyLikeButton> {
  bool _isLiked = false;
  int _likeCount = 33;

  Future<void> _toggleLike() async {
    setState(() {
      _isLiked = !_isLiked;

      if (_isLiked) {
        _likeCount++;
      } else {
        _likeCount--;
      }
    });

    if (_isLiked) {
      await VisitorLocalStorageService.saveLikeId(widget.propertyId);
    } else {
      await VisitorLocalStorageService.removeLikeId();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _toggleLike,
            borderRadius: BorderRadius.circular(50),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isLiked ? const Color(0xff006D77) : Colors.white,
                border: Border.all(color: const Color(0xff006D77), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.white : const Color(0xff006D77),
                size: 25,
              ),
            ),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          '$_likeCount',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff006D77),
          ),
        ),
      ],
    );
  }
}
