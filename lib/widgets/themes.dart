import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    hintColor: Colors.deepPurple,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: lightBluishColor),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      toolbarTextStyle: TextStyle(color: Colors.black),
    ),
  );

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkcreamColor,
    hintColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: lightBluishColor),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      toolbarTextStyle: TextStyle(color: Colors.white),
    ),
  );

  static Color creamColor = const Color.from(
    alpha: 1,
    red: 0.961,
    green: 0.961,
    blue: 0.961,
  );
  static Color darkcreamColor = const Color.fromARGB(255, 3, 47, 158);
  static Color darkBluishColor = const Color.fromRGBO(44, 8, 220, 0.944);
  static Color lightBluishColor = const Color.fromARGB(241, 6, 39, 231);
}
