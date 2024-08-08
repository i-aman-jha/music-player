import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/configs/theme/theme_colors.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black,
      )),
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  textTheme: ThemeData.dark().textTheme.copyWith(
        titleMedium: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: GoogleFonts.roboto(
          color: Colors.white.withOpacity(.5),
        ),
        displayLarge: GoogleFonts.roboto(
          color: Colors.white,
        ),
        displayMedium: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: GoogleFonts.roboto(
          color: const Color(0xffffffff),
        ),
        headlineSmall: GoogleFonts.roboto(
          color: const Color(0xd3eaeaea),
        ),
        displaySmall: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.roboto(
          color: const Color(0xd3eaeaea),
        ),
        bodySmall: GoogleFonts.roboto(
          color: const Color.fromRGBO(214, 212, 212, 0.8),
        ),
        bodyLarge: GoogleFonts.roboto(
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateColor.resolveWith((states) => Colors.white),
  ),
  sliderTheme: const SliderThemeData(
    inactiveTrackColor: Color.fromRGBO(147, 147, 147, 0.792156862745098),
    trackHeight: 2,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
      secondary: const Color(0xff73777a),
      primary: Colors.white,
      onPrimary: const Color(0xffA0A0A0),
      outline: Colors.black,
      onSurface: const Color(0xff202934),
      brightness: Brightness.dark,
      surface: const Color(0xff202934),
      primaryContainer: const Color(0xff2d3236),
      onPrimaryContainer: const Color(0xff5a5f62)),
  primaryColor: ThemeColors.primaryColor,
  scaffoldBackgroundColor: ThemeColors.darkBackColor,
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
      shape: WidgetStatePropertyAll<CircleBorder>(CircleBorder()),
      overlayColor: WidgetStatePropertyAll<Color>(Color.fromARGB(179, 7, 7, 7)),
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
        foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
        shape:
            WidgetStatePropertyAll<OutlinedBorder?>(RoundedRectangleBorder()),
        overlayColor: WidgetStatePropertyAll<Color>(Colors.grey)),
  ),
  searchBarTheme: const SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
    shape: WidgetStatePropertyAll<OutlinedBorder?>(RoundedRectangleBorder()),
    hintStyle:
        WidgetStatePropertyAll<TextStyle?>(TextStyle(color: Colors.black26)),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.black26),
    labelStyle: TextStyle(color: Colors.black),
    filled: true,
    fillColor: Colors.white,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.black,
    shadowColor: Color.fromARGB(179, 78, 76, 76),
  ),
);
