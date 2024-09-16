
import 'package:erickshawapp/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:erickshawapp/shared/state/app-theme/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// //////////////////////////////////////////////////////////////
/// Styles - Contains the design system for the entire app.
/// Includes paddings, text styles, timings etc. Does not include colors, check [AppTheme] file for that.

/// Used for all animations in the  app
class Times {
  static const Duration fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}

class Sizes {
  static double hitScale = 1;
  static double get hit => 20 * hitScale;
}

class IconSizes {
  static const double scale = 1;
  static const double med = 24;
  static const double sm = 16;
}

class Insets {
  static double scale = 1;
  static double offsetScale = 1;
  // Regular paddings
  static double get xs => 4 * scale;
  static double get sm => 8 * scale;
  static double get med => 12 * scale;
  static double get lg => 16 * scale;
  static double get xl => 32 * scale;
  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get offset => 40 * offsetScale;
}

class Paddings {
  static final contentPadding = EdgeInsets.all(Insets.med);
  static final horizontalPadding = EdgeInsets.symmetric(horizontal: Insets.med);
  static final verticalPadding = EdgeInsets.symmetric(vertical: Insets.med);

  // Height Paddings
  static EdgeInsets get hxs => EdgeInsets.symmetric(vertical: Insets.xs);
  static EdgeInsets get hsm => EdgeInsets.symmetric(vertical: Insets.sm);
  static EdgeInsets get hmed => EdgeInsets.symmetric(vertical: Insets.med);
  static EdgeInsets get hlg => EdgeInsets.symmetric(vertical: Insets.lg);
  static EdgeInsets get hxl => EdgeInsets.symmetric(vertical: Insets.xl);
}

class Corners {
  static const double sm = 4;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double med = 5;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 12;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);

  static const double circular = 100;
  static const BorderRadius circularBorder = BorderRadius.all(circularRadius);
  static const Radius circularRadius = Radius.circular(100);
}

class Strokes {
  static const double thin = 1;
  static const double thick = 4;
}

class Shadows {
  static List<BoxShadow> get universal => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 10),
      ];
  static List<BoxShadow> get small => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 1)),
      ];
}

/// Font Sizes
/// You can use these directly if you need, but usually there should be a predefined style in TextStyles.
class FontSizes {
  /// Provides the ability to nudge the app-wide font scale in either direction
  static double get scale => 1;
  static double get s10 => 10.sp * scale;
  static double get s11 => 11.sp * scale;
  static double get s12 => 12.sp * scale;
  static double get s14 => 14.sp * scale;
  static double get s16 => 16.sp * scale;
  static double get s24 => 24.sp * scale;
  static double get s48 => 48.sp * scale;
}

/// Fonts - A list of Font Families, this is uses by the TextStyles class to create concrete styles.
class Fonts {}

/// TextStyles - All the core text styles for the app should be declared here.
/// Don't try and create every variant in existence here, just the high level ones.
/// More specific variants can be created on the fly using `style.copyWith()`
/// `newStyle = TextStyles.body1.copyWith(lineHeight: 2, color: Colors.red)`
class TextStyles {

  static final AppFont = GoogleFonts.nunitoSans();



  /// Declare a base style for each Family
  static TextStyle textFormFieldDefaultStyle = TextStyles.body1
      .copyWith(fontWeight: FontWeight.normal, color: Colors.black);

  static TextStyle textFormFieldDefaultStyle_12 = TextStyles.body2
      .copyWith(fontWeight: FontWeight.normal, color: Colors.black);

  static TextStyle textFormFieldDefaultStyle_14 = TextStyles.body2_14
      .copyWith(fontWeight: FontWeight.normal, color: Colors.black);

  static TextStyle textFormFieldDefaultStyle_16 = TextStyles.body1
      .copyWith(fontWeight: FontWeight.normal, color: Colors.black);

  static TextStyle get h1 => AppFont.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.s48,
      letterSpacing: -1,
      height: 1.17);

  static TextStyle get h2 =>
      h1.copyWith(fontSize: FontSizes.s24, letterSpacing: -.5, height: 1.16,color: Colors.black);

  static TextStyle get h3 =>
      h1.copyWith(fontSize: FontSizes.s14, letterSpacing: -.05, height: 1.29);

  static TextStyle get title1 => AppFont.copyWith(
      fontWeight: FontWeight.bold, fontSize: FontSizes.s16, height: 1.31);

  static TextStyle get title2 => title1.copyWith(
      fontWeight: FontWeight.w500, fontSize: FontSizes.s14, height: 1.36);

  static TextStyle get title3 => AppFont.copyWith(
      fontWeight: FontWeight.bold, fontSize: FontSizes.s14, height: 1.31);

  static TextStyle get title4 => AppFont.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: FontSizes.s14,
      height: 1.31);

  static TextStyle get appBarTitle => AppFont.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.s16,
      color: Colors.black);

  static TextStyle get bottomSheetTitle => AppFont.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.s16,
      color: Colors.black);

  static TextStyle get body1 =>
      AppFont.copyWith(fontWeight: FontWeight.normal, fontSize: FontSizes.s16);

  static TextStyle get body2 =>
      body1.copyWith(fontSize: FontSizes.s12, letterSpacing: .2);

  static TextStyle get body2_14 =>
      body1.copyWith(fontSize: FontSizes.s14, letterSpacing: .2);

  static TextStyle get saveButtonStyle => body1.copyWith(
      fontSize: FontSizes.s14, letterSpacing: .2, fontWeight: FontWeight.w500);

  static TextStyle get body3 => body1.copyWith(
      fontSize: FontSizes.s12,
      height: 1.5,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF323A45));

  static TextStyle simple = TextStyles.body2_14
      .copyWith(fontWeight: FontWeight.normal, color: const Color(0xFF8B959E));

  static TextStyle get callout1 => AppFont.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: FontSizes.s12,
      height: 1.17,
      letterSpacing: .5);

  static TextStyle get callout2 =>
      callout1.copyWith(height: 1, letterSpacing: .25, color: Colors.grey);

  static TextStyle get caption => AppFont.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: FontSizes.s11,
      height: 1.36,
      letterSpacing: 0.9);


}


class ButtonStyles {
  static ButtonStyle normal(BuildContext context) {
    final theme = Theme.of(context);

    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all(theme.colorScheme.secondary),
      backgroundColor: MaterialStateProperty.all(theme.colorScheme.primary),
    );
  }

}

