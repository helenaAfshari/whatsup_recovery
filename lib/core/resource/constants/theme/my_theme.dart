
import 'package:flutter/material.dart';
import 'package:notif/core/resource/constants/my_colors.dart';

class MyTHeme {
  static ThemeData lightTheme() => ThemeData(
        textTheme: const TextTheme(
          ///Title
          titleLarge: TextStyle(
            fontFamily: 'IranSans',
            fontWeight: FontWeight.w100,
            color: MyColors.textColor,
            fontSize: 15,
          ),
          headlineSmall: TextStyle(
            fontFamily:'IranSans',
            fontWeight: FontWeight.w100,
            color: MyColors.textColor,
            fontSize: 10,
          )
          ),
          
          
          );
             
}