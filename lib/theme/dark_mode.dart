import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primaryContainer: Colors.grey.shade800,
        primary: const Color(0xFFB6E1FF),
        tertiary: Colors.white,
        secondary: const Color(0xFF75A1D9), // icons
        inversePrimary: const Color(0xFF336699) // buttons and actions keys
        ),
        highlightColor: Colors.grey.shade800,
    // c
    // buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF336699)),
    checkboxTheme: const CheckboxThemeData(
        side: BorderSide(color: Color(0xFF336699), width: 2)),
    radioTheme: RadioThemeData(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        // if (states.contains(MaterialState.selected)) {
        //   return Color(0xFF480674);
        // }
        return const Color(0xFF336699);
      }),
    ),
    switchTheme: SwitchThemeData(
      trackColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFF336699);
        }
        return Colors.grey.shade700;
      }),
      thumbColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return Colors.grey;
      }),
      trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white60,
      indicatorColor: Color(0xFF336699),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.grey.shade800,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 1.7.h,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
    ),
    textTheme: ThemeData.dark().textTheme.apply(
        // bodyColor: Colors.grey[100],
        // displayColor: Colors.white,
        fontFamily: 'Montserrat'),
         dividerTheme: DividerThemeData(
    color: Colors.grey[200]
  ),
        );


// ECHO DARK THEME
ThemeData echoDarkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF162B26),
        primaryContainer: Color(0xFF375452),
        primary: Color(0xFFB6FFDB),
        tertiary: Colors.white,
        secondary: Color(0xFF75D9B1), // icons
        inversePrimary: Color(0xFF339963) // buttons and actions keys
        ),
        highlightColor: const Color(0xFF375452),
    // c
    // buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF336699)),
    checkboxTheme: const CheckboxThemeData(
        side: BorderSide(color:  Color(0xFF339963), width: 2)),
    radioTheme: RadioThemeData(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        // if (states.contains(MaterialState.selected)) {
        //   return Color(0xFF480674);
        // }
        return const Color(0xFF339963);
      }),
    ),
    switchTheme: SwitchThemeData(
      trackColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFF339963);
        }
        return const Color(0xFF375452);
      }),
      thumbColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return Colors.grey;
      }),
      trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white60,
      indicatorColor:  Color(0xFF339963),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF375452),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 1.7.h,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
    ),
    textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.grey[100],
        displayColor: Colors.white,
        fontFamily: 'Montserrat'),
         dividerTheme: DividerThemeData(
    color: Colors.grey[200]
  ),);


  // FIDELITY DARK THEME
  ThemeData fidelityDarkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF161639),
        primaryContainer:  Color(0xFF383657),
        primary: Color(0xFFB6BCFF),
        tertiary: Colors.white,
        secondary: Color(0xFFC275D9), // icons
        inversePrimary: Color(0xFF1D3194) // buttons and actions keys
        ),
        highlightColor: const Color(0xFF383657),
    // c
    // buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF336699)),
    checkboxTheme: const CheckboxThemeData(
        side: BorderSide(color:  Color(0xFF1D3194), width: 2)),
    radioTheme: RadioThemeData(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        // if (states.contains(MaterialState.selected)) {
        //   return Color(0xFF480674);
        // }
        return const Color(0xFF1D3194);
      }),
    ),
    switchTheme: SwitchThemeData(
      trackColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFF1D3194);
        }
        return const Color(0xFF383657);
      }),
      thumbColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return Colors.grey;
      }),
      trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white60,
      indicatorColor:  Color(0xFF1D3194),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF383657),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 1.7.h,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
    ),
    textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.grey[100],
        displayColor: Colors.white,
        fontFamily: 'Montserrat'),
         dividerTheme: DividerThemeData(
    color: Colors.grey[200]
  ),);


