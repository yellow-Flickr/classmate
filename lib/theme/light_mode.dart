import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: const Color(0xffF8F8F8),
      surface: const Color(0xFFF8F8F8),
      primaryContainer: Colors.grey.shade200,
      inversePrimary: const Color(0xFF3A855E),
      tertiary: Colors.grey,
      secondary: const Color(0xFFF9BC60), // icons
     primary: const Color(0xFF093634) // buttons and actions keys
      // inversePrimary: const Color(0xFF093634) // buttons and actions keys
      ),

      scaffoldBackgroundColor: const Color(0xffF8F8F8),
  highlightColor: Colors.grey.shade200,
  // buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF093634)),
  
  checkboxTheme: CheckboxThemeData(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFF093634);
        }
        return Colors.transparent;
      }),
      side: const BorderSide(
        color: Color(0xFF093634),
        width: 2,
      )),
  radioTheme: RadioThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      // if (states.contains(MaterialState.selected)) {
      //   return Color(0xFF480674);
      // }
      return const Color(0xFF093634);
    }),
  ),
  switchTheme: SwitchThemeData(
    trackColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Color(0xFF093634);
      }
      return Colors.grey.shade300;
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
    indicatorColor: Color(0xFF093634),
  ),
  
  segmentedButtonTheme: SegmentedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return const Color(0xFF093634);
          }
          return null;
        },
      ),
    ),
  ),

  appBarTheme: AppBarTheme(
    foregroundColor: Colors.grey.shade800,
    backgroundColor: const Color(0xffF8F8F8),
    // systemOverlayStyle: Sys,
    // foregroundColor: Colors.white,
    // backgroundColor: const Color(0xFF093634),
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 1.7.h,
        fontWeight: FontWeight.w700,
        fontFamily: 'WorkSans'),
  ),
  textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.grey[800],
      displayColor: Colors.black,
      fontFamily: 'WorkSans'),
  dividerTheme: const DividerThemeData(color: Colors.grey),
);

// ECHO THEME
ThemeData echoLightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Colors.grey.shade100,
      primaryContainer: Colors.grey.shade200,
      primary: const Color(0xFFB6FFDB),
      tertiary: Colors.grey,
      secondary: const Color(0xFF75D9B1), // icons
      inversePrimary: const Color(0xFF339963) // buttons and actions keys
      ),
  highlightColor: Colors.grey.shade200,
  // c
  // buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF093634)),
  checkboxTheme: const CheckboxThemeData(
      side: BorderSide(color: Color(0xFF339963), width: 2)),
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
      return Colors.grey.shade300;
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
    indicatorColor: Color(0xFF339963),
  ),
  appBarTheme: AppBarTheme(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xFF339963),
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 1.7.h,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat'),
  ),
  textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.grey[800],
      displayColor: Colors.black,
      fontFamily: 'Montserrat'),
  dividerTheme: const DividerThemeData(color: Colors.grey),
);

// FIDELITY THEME
ThemeData fidelityLightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Colors.grey.shade100,
      primaryContainer: Colors.grey.shade200,
      primary: const Color(0xFFB6BCFF),
      tertiary: Colors.grey,
      secondary: const Color(0xFFC275D9), // icons
      inversePrimary: const Color(0xFF1D3194)),
  highlightColor: Colors.grey.shade200,
  // c
  // buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF093634)),
  checkboxTheme: const CheckboxThemeData(
      side: BorderSide(color: Color(0xFF1D3194), width: 2)),
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
      return Colors.grey.shade300;
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
    indicatorColor: Color(0xFF1D3194),
  ),
  appBarTheme: AppBarTheme(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xFF1D3194),
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 1.7.h,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat'),
  ),
  textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.grey[800],
      displayColor: Colors.black,
      fontFamily: 'Montserrat'),
  dividerTheme: const DividerThemeData(color: Colors.grey),
);
