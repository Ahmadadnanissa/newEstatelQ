import 'package:flutter/widgets.dart';

class SlideRight extends PageRouteBuilder {
  final Widget? page;
  SlideRight({this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page!,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1, 0);
          var end = const Offset(0, 0);
          var tween = Tween(begin: begin, end: end);
          var curvesanimation = CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          );
          return SlideTransition(
            position: tween.animate(curvesanimation),
            child: child,
          );
        },
      );
}
