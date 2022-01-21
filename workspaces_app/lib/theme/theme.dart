import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    disabledColor: Colors.grey[300],
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: 30),
    ),
    buttonColor: Color(0xFF122F3A),
    primaryIconTheme: IconThemeData(color: Colors.black),
    // elevatedButtonTheme: ElevatedButtonThemeData(),
    colorScheme: ColorScheme.light(
      primary: Color(0xFF122F3A), //Color(0xFFBECD18),
      onPrimary: Colors.white,
      primaryVariant: Color(0xFF8E8E93),
      secondary: Color(0xFF8E8E93),
      onBackground: Color(0xFF122F3A),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    fontFamily: 'Nunito',
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Colors.white, //Color(0xFF82B229),
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
      subtitle2: TextStyle(
          color: Color(0xFF8E8E93),
          fontSize: 16.0,
          fontWeight: FontWeight.w400),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: Color(0xFFFFFFFF),
    //   border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: BorderSide(
    //           color: Colors.black, style: BorderStyle.solid, width: 1)),
    // )
  );

  static final ThemeData darkTheme = ThemeData(
    disabledColor: Colors.grey[300],
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: 30),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Color(0xFFFF3467),
      primaryVariant: Color(0xFF6F8EAE),
      secondary: Color(0xFFFF3467),
      onBackground: Color(0xFFFF3467),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Colors.white, //Color(0xFF82B229),
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
          color: Color(0xFFFF3467), //Color(0xFF82B229),
          fontSize: 30.0,
          fontWeight: FontWeight.bold),
      subtitle2: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: Color(0xFFF5F3F4),
    //   border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(20),
    //       borderSide: BorderSide.none),
    // )
  );
}
