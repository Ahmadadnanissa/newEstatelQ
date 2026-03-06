import 'package:estatelqapp/core/widgets/name_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitlePage extends StatelessWidget {
  TitlePage({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [NamePage(name: title)],
    );
  }
}
