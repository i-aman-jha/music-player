import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/configs/theme/theme_colors.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
          // statusBarBrightness: Brightness.light,
          ),
      iconTheme: IconThemeData(
        color: Colors.black,
      )),
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
  scaffoldBackgroundColor: Colors.white,
  primaryColor: ThemeColors.primaryColor,
  radioTheme: RadioThemeData(
    fillColor: WidgetStateColor.resolveWith((states) => Colors.black),
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
      secondary: const Color(0xffa1a1a1),
      primary: const Color(0xff0F0425),
      onPrimary: const Color(0xff9694B8),
      outline: const Color(0xfff0f0f0),
      onSurface: const Color(0xfff6f8f8),
      surface: const Color(0xffDCE8E8),
      primaryContainer: Colors.black,
      onPrimaryContainer: const Color(0xffd8d8da)),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  sliderTheme: const SliderThemeData(
    inactiveTrackColor: Color.fromRGBO(147, 147, 147, 0.792156862745098),
    activeTrackColor: Colors.black,
    thumbColor: Colors.black,
    trackHeight: 2,
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        titleMedium: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: GoogleFonts.roboto(
          color: Colors.black,
        ),
        displayLarge: GoogleFonts.roboto(
          color: Colors.black,
        ),
        displayMedium: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: GoogleFonts.roboto(
          color: const Color.fromRGBO(0, 0, 0, 1),
        ),
        headlineSmall: GoogleFonts.roboto(
          color: const Color.fromRGBO(58, 58, 58, 0.8352941176470589),
        ),
        displaySmall: GoogleFonts.roboto(
          color: const Color.fromRGBO(0, 0, 0, 1),
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.roboto(
          color: const Color.fromRGBO(0, 0, 0, 1),
        ),
        bodySmall: GoogleFonts.roboto(
          color: const Color.fromRGBO(0, 0, 0, 1),
        ),
        bodyLarge: GoogleFonts.roboto(
          color: const Color.fromRGBO(0, 0, 0, 1),
        ),
      ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
      shape: WidgetStatePropertyAll<CircleBorder>(CircleBorder()),
      overlayColor:
          WidgetStatePropertyAll<Color>(Color.fromARGB(168, 255, 255, 255)),
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
      foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
      shape: WidgetStatePropertyAll<OutlinedBorder?>(RoundedRectangleBorder()),
    ),
  ),
  searchBarTheme: const SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
    shape: WidgetStatePropertyAll<OutlinedBorder?>(RoundedRectangleBorder()),
    hintStyle:
        WidgetStatePropertyAll<TextStyle?>(TextStyle(color: Colors.white70)),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.white70),
    filled: true,
    fillColor: Colors.black,
    labelStyle: TextStyle(color: Colors.white),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
  ),
);
