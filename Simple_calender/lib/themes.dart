import 'package:flutter/material.dart';


final kLightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
        color: Colors.blue
    ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.blue), // Устанавливаем цвет текста для bodyText1
    bodyMedium: TextStyle(color: Colors.lightBlue, ), // Устанавливаем цвет текста для bodyText2
  // Добавьте другие стили текста по необходимости
),

);
final kDarkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
    color: Colors.brown
  ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.brown), // Устанавливаем цвет текста для bodyText1
      bodyMedium: TextStyle(color: Colors.grey), // Устанавливаем цвет текста для bodyText2
)
);

