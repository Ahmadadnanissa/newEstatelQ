import 'package:estatelqapp/core/them_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeToggleTile extends StatelessWidget {
  const ThemeToggleTile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ListTile(
      leading: Icon(themeProvider.isDark ? Icons.dark_mode : Icons.light_mode),
      title: const Text("Them App"),
      trailing: Switch(
        value: themeProvider.isDark,
        onChanged: (value) {
          themeProvider.setTheme(value);
        },
      ),
      onTap: () {
        themeProvider.toggleTheme();
      },
    );
  }
}
