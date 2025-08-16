import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData ligtTheme = ThemeData(
    brightness: Brightness.light,
   

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,

    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  
   
    
     floatingActionButtonTheme: FloatingActionButtonThemeData(
      
      backgroundColor:Color(0xff101127),
      
    )
  );
}