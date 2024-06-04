import 'package:flutter/material.dart';

class AppTheme {
  static Color appColor=Colors.brown.shade600;
  static Color borderCplor=Colors.brown;
  static var borderShape = MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
  static ThemeData theme=ThemeData(
    useMaterial3: true,
    primaryColor: appColor,
    colorScheme: ColorScheme.fromSeed(seedColor: appColor),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: appColor,
      focusColor: appColor,
      prefixIconColor: borderCplor,
      suffixIconColor: borderCplor,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderCplor,width: 2),
        borderRadius: BorderRadius.circular(10)
        ),
      outlineBorder: BorderSide(color: appColor )
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle( shape:  borderShape )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle( shape: borderShape )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle( shape: borderShape )
    ),
    dialogTheme: DialogTheme(
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(15)
      )
    )
  );

  static ThemeData darkTheme=ThemeData.dark().copyWith(
    // colorScheme: ColorScheme.fromSeed(seedColor: appColor),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderCplor,width: 2),
        borderRadius: BorderRadius.circular(10)
        ),
      outlineBorder: BorderSide(color: appColor )
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape:  borderShape,
        foregroundColor: MaterialStatePropertyAll(Colors.grey.shade300),
        backgroundColor: MaterialStatePropertyAll(Colors.grey.shade800),
        elevation:const MaterialStatePropertyAll(3)
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle( shape: borderShape )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle( shape: borderShape )
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade800
    ),
    dialogTheme: DialogTheme(
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(15)
      )
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.grey.shade300
    )
  );
}