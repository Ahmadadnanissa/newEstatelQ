import 'dart:async';
import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAboutPropertyHomePage extends StatefulWidget {
  final TextEditingController? controller;

  const SearchAboutPropertyHomePage({super.key, this.controller});

  @override
  State<SearchAboutPropertyHomePage> createState() =>
      _SearchAboutPropertyHomePageState();
}

class _SearchAboutPropertyHomePageState
    extends State<SearchAboutPropertyHomePage> {
  Timer? _debounce;

  void _onSearchChanged(String value, HomeProvider provider) {
    widget.controller?.text = value;

    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 400), () {
      provider.setSearch(value);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final provider = context.read<HomeProvider>();

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color borderColor = isDark
        ? darkSurfaceColor
        : const Color(0xffE5F0F4);

    final Color hintColor = isDark ? darkSubtitleColor : Colors.grey;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.04,
        horizontal: width * 0.04,
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: (value) => _onSearchChanged(value, provider),

        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontFamily: fontFamily,
        ),

        decoration: InputDecoration(
          fillColor: Theme.of(context).cardColor,
          filled: true,

          prefixIcon: Icon(
            Icons.search_rounded,
            color: secondaryColor,
            size: width * 0.06,
          ),

          hintText: "Search properties (city, title, description...)",

          hintStyle: TextStyle(
            color: hintColor,
            fontSize: width * 0.037,
            fontFamily: fontFamily,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: secondaryColor, width: 1.2),
          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),

          contentPadding: EdgeInsets.symmetric(vertical: width * 0.035),
        ),
      ),
    );
  }
}
