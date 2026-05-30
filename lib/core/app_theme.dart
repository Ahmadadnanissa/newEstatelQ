import 'package:flutter/material.dart';

// ================= COLORS =================

const primaryColor = Colors.white;

const secondaryColor = Color(0xff006D77);
const greenColor = Color(0xff83C5BE);
const grayColor = Color(0xffEDF6F9);
const blackColor = Colors.black;
const fontFamily = 'Inter';

// ================= DARK MODE COLORS =================

// خلفية التطبيق (أخف من الأسود)
const darkBackgroundColor = Color(0xff1B1B1B);

// لون موحد للكروت + الحقول + الكونتينرات
const darkSurfaceColor = Color(0xff2A2A2A);

// لون إضافي خفيف للعناصر المميزة
const darkContainerColor = Color(0xff323232);

// لون النص الأساسي
const darkTextColor = Color(0xffF5F5F5);

// لون النص الثانوي
const darkSubtitleColor = Color(0xffB0B0B0);

class AppTheme {
  // ================= LIGHT THEME =================

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    brightness: Brightness.light,

    scaffoldBackgroundColor: primaryColor,

    colorScheme: const ColorScheme.light(
      primary: secondaryColor,
      secondary: greenColor,
      surface: Colors.white,
      surfaceContainerHighest: Color(0xffE8F3F5),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: blackColor,
    ),

    // ================= APP BAR =================
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: secondaryColor),
      titleTextStyle: TextStyle(
        color: blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      ),
    ),

    // ================= ICONS =================
    iconTheme: const IconThemeData(color: secondaryColor),

    // ================= CARDS =================
    cardColor: Colors.white,

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // ================= TEXT =================
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: blackColor),
      bodyMedium: TextStyle(color: blackColor),
      titleLarge: TextStyle(color: blackColor, fontWeight: FontWeight.bold),
    ),

    // ================= INPUT =================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: grayColor,

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: secondaryColor, width: 1.5),
      ),

      hintStyle: TextStyle(color: Colors.grey.shade600),
    ),

    // ================= BUTTONS =================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),

    // ================= BOTTOM NAVIGATION =================
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: secondaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
  );

  // ================= DARK THEME =================

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    brightness: Brightness.dark,

    // خلفية أخف وأفخم
    scaffoldBackgroundColor: darkBackgroundColor,

    colorScheme: const ColorScheme.dark(
      primary: secondaryColor,
      secondary: greenColor,
      surface: darkSurfaceColor,
      onPrimary: Colors.white,
      surfaceContainerHighest: Color(0xff1F2629),
      onSecondary: Colors.white,
      onSurface: darkTextColor,
    ),

    // ================= APP BAR =================
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackgroundColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: secondaryColor),
      titleTextStyle: TextStyle(
        color: darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      ),
    ),

    // ================= ICONS =================
    iconTheme: const IconThemeData(color: secondaryColor),

    // ================= CARDS =================
    cardColor: darkSurfaceColor,

    cardTheme: CardThemeData(
      color: darkSurfaceColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // ================= TEXT =================
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: darkTextColor),
      bodyMedium: TextStyle(color: darkTextColor),
      titleLarge: TextStyle(color: darkTextColor, fontWeight: FontWeight.bold),
    ),

    // ================= INPUT =================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,

      // نفس لون الكروت
      fillColor: darkSurfaceColor,

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: greenColor, width: 1.5),
      ),

      hintStyle: const TextStyle(color: darkSubtitleColor),
    ),

    // ================= BUTTONS =================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),

    // ================= BOTTOM NAVIGATION =================
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkSurfaceColor,
      selectedItemColor: secondaryColor,
      unselectedItemColor: darkSubtitleColor,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
