import 'package:flutter/material.dart';

// All rights reserved by Healer

class AppTheme {
  static const darkBlueColor = Color(0xff151a2e);
  static Color lightText = Colors.white.withOpacity(0.7);
  static const blueColor = Color(0xff4cadef);
  static const containerColor = Color(0xff2b2c6c);
  static const textColor = Color(0xff2e366e);

  static ThemeData data() => ThemeData(
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        primaryColor: darkBlueColor,
        // textTheme: _textTheme(),
        popupMenuTheme: _popUpMenuThemeData(),
        scaffoldBackgroundColor: darkBlueColor,
        backgroundColor: Colors.white,
        cardColor: containerColor,
        splashColor: darkBlueColor,
        highlightColor: Colors.blueGrey[200]?.withOpacity(.25),
        dividerColor: blueColor,

        textSelectionTheme: _textSelectionTheme(),
        textButtonTheme: _textButtonTheme(),
        outlinedButtonTheme: _outlinedButtonThemeData(),
        canvasColor:
            Colors.transparent, //This is necessary for bottomSheet to work.
      );

  static PopupMenuThemeData _popUpMenuThemeData() => PopupMenuThemeData(
        elevation: 15,
        color: Colors.white,
        textStyle: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
      );

  static TextSelectionThemeData _textSelectionTheme() => TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionHandleColor: containerColor,
        selectionColor: containerColor.withOpacity(.1),
      );

  static TextButtonThemeData _textButtonTheme() => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: blueColor,
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonThemeData() =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: blueColor,
          side: const BorderSide(
            color: blueColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      );
}
