import 'package:erickshawapp/design-system/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';


final WidgetStateProperty<Color?> overlayColor =
    WidgetStateProperty.resolveWith<Color?>(
  (Set<WidgetState> states) {
    // Material color when switch is selected.
    if (states.contains(WidgetState.selected)) {
      return kPrimaryColor;
    }
    // Material color when switch is disabled.
    if (states.contains(WidgetState.disabled)) {
      return Colors.grey.shade400;
    }
    // Otherwise return null to set default material color
    // for remaining states such as when the switch is
    // hovered, or focused.
    return null;
  },
);

ThemeData get LightTheme => ThemeData(
      fontFamily: 'Nunito',
      colorScheme: const ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kDarkColor,
      ),
      textTheme: GoogleFonts.nunitoTextTheme(),
      checkboxTheme: CheckboxThemeData(
        shape: const RoundedRectangleBorder(borderRadius: Corners.smBorder),
        side: const BorderSide(color: kPrimaryColor),
        checkColor: const WidgetStatePropertyAll(Colors.white),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return kPrimaryColor;
          }
          return null;
        }),
      ),
      listTileTheme:
          ListTileThemeData(selectedTileColor: kPrimaryColor.withOpacity(0.1)),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(color: kLightGreyColor),
      switchTheme: SwitchThemeData(
        trackColor: const WidgetStatePropertyAll(kLightGreyColor),
        thumbColor: overlayColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: kPrimaryColor, applyThemeToAll: true),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 14)))),
      radioTheme: RadioThemeData(
        fillColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return kPrimaryColor; // Active color
          }
          return Colors.grey; // Passive color
        }),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          centerTitle: true,
          titleTextStyle: TextStyles.title1.copyWith(color: Colors.black)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white, backgroundColor: kPrimaryColor),
      tabBarTheme: const TabBarTheme(
          labelColor: kPrimaryColor,
          indicatorColor: kPrimaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label),
      inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.fromLTRB(8, 5.0, 0, 5.0),
          border: OutlineInputBorder(),
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          isDense: false,
          suffixIconColor: Colors.grey),
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              textStyle: WidgetStatePropertyAll(TextStyles.body1),
              shape: const WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: Corners.smBorder)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: const WidgetStatePropertyAll(
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0))),
              elevation: const WidgetStatePropertyAll(0.0),
              fixedSize: WidgetStatePropertyAll(Size.fromHeight(40.h)))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              textStyle: const WidgetStatePropertyAll(
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0))),
              elevation: const WidgetStatePropertyAll(0.0),
              fixedSize: WidgetStatePropertyAll(Size.fromHeight(30.h)))),
      useMaterial3: false,
    );

ThemeData DarkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  primaryColor: Colors.blue[900],
);
