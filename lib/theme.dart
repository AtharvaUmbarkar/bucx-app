import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _primarySwatchARGB = 0xFF4E60FF;

const MaterialColor primarySwatch = MaterialColor(
  _primarySwatchARGB,
  <int, Color>{
    50: Color(0xFFF0EFFF),
    100: Color(0xFFDEE0FF),
    200: Color(0xFFBBC2FF),
    300: Color(0xFF99A4FF),
    400: Color(0xFF7686FF),
    500: Color(_primarySwatchARGB),
    600: Color(0xFF3647E9),
    700: Color(0xFF1327D3),
    800: Color(0xFF0009A7),
    900: Color(0xFF00036B),
  },
);

const _secondarySwatchARGB = 0xFFFFDFA5;

const MaterialColor secondarySwatch = MaterialColor(
  _secondarySwatchARGB,
  <int, Color>{
    50: Color(0xFFFFEFD3),
    100: Color(_secondarySwatchARGB),
    200: Color(0xFFF4BE48),
    300: Color(0xFFD6A32E),
    400: Color(0xFFB9890F),
    500: Color(0xFF9B7000),
    600: Color(0xFF7B5800),
    700: Color(0xFF5D4200),
    800: Color(0xFF412D00),
    900: Color(0xFF261900),
  },
);

const _tertiarySwatchARGB = 0xFFF89700;

const MaterialColor tertiarySwatch = MaterialColor(
  _tertiarySwatchARGB,
  <int, Color>{
    50: Color(0xFFFFEEDE),
    100: Color(0xFFFFDCB9),
    200: Color(0xFFFFB867),
    300: Color(_tertiarySwatchARGB),
    400: Color(0xFFD17D00),
    500: Color(0xFFAD6700),
    600: Color(0xFF8A5100),
    700: Color(0xFF693C00),
    800: Color(0xFF492900),
    900: Color(0xFF2C1600),
  },
);

const _errorSwatchARGB = 0xFFBA1B1B;

const MaterialColor errorSwatch = MaterialColor(
  _errorSwatchARGB,
  <int, Color>{
    50: Color(0xFFFFEDE9),
    100: Color(0xFFFFDAD4),
    200: Color(0xFFFFB4A9),
    300: Color(0xFFFF897A),
    400: Color(0xFFFF5449),
    500: Color(0xFFDD3730),
    600: Color(_errorSwatchARGB),
    700: Color(0xFF930006),
    800: Color(0xFF680003),
    900: Color(0xFF410001),
  },
);

const _neutralSwatchARGB = 0xFF575A75;

const MaterialColor neutralSwatch = MaterialColor(
  _neutralSwatchARGB,
  <int, Color>{
    50: Color(0xFFF3F0F5),
    100: Color(0xFFE4E1E6),
    200: Color(0xFFC8C5CA),
    300: Color(0xFFACAAAF),
    400: Color(0xFF929094),
    500: Color(0xFF78767A),
    600: Color(0xFF5F5E62),
    700: Color(0xFF47464A),
    800: Color(0xFF303034),
    900: Color(0xFF1B1B1F),
  },
);

const _neutralVariantSwatchARGB = 0xFF5E5E67;

const MaterialColor neutralVariantSwatch = MaterialColor(
  _neutralVariantSwatchARGB,
  <int, Color>{
    50: Color(0xFFF1EFFA),
    100: Color(0xFFE3E1EC),
    200: Color(0xFFC7C5D0),
    300: Color(0xFFABAAB4),
    400: Color(0xFF91909A),
    500: Color(0xFF77767F),
    600: Color(0xFF5E5E67),
    700: Color(0xFF46464F),
    800: Color(0xFF303038),
    900: Color(0xFF1B1B23),
  },
);

final ColorScheme appLightColors = ColorScheme(
  brightness: Brightness.light,
  primary: primarySwatch.shade500,
  onPrimary: primarySwatch.shade50,
  primaryContainer: primarySwatch.shade100,
  onPrimaryContainer: primarySwatch.shade900,
  secondary: secondarySwatch.shade100,
  onSecondary: secondarySwatch.shade50,
  secondaryContainer: secondarySwatch.shade100,
  onSecondaryContainer: secondarySwatch.shade900,
  tertiary: tertiarySwatch.shade300,
  onTertiary: tertiarySwatch.shade50,
  tertiaryContainer: tertiarySwatch.shade100,
  onTertiaryContainer: tertiarySwatch.shade900,
  error: errorSwatch.shade400,
  onError: errorSwatch.shade50,
  errorContainer: errorSwatch.shade100,
  onErrorContainer: errorSwatch.shade900,
  background: Colors.white,
  onBackground: neutralSwatch.shade900,
  surface: neutralSwatch.shade200,
  onSurface: neutralSwatch.shade900,
  surfaceVariant: neutralVariantSwatch.shade100,
  onSurfaceVariant: neutralVariantSwatch.shade700,
  outline: neutralVariantSwatch.shade500,
);

final String? poppinsFontFamily = GoogleFonts.poppins().fontFamily;

final ThemeData lightTheme = ThemeData(
  primaryColor: primarySwatch.shade500,
  primarySwatch: primarySwatch,
  primaryColorDark: primarySwatch.shade600,
  colorScheme: appLightColors,
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    headline1: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontStyle: FontStyle.normal,
      // height: 52 / 40,
    ),
    headline4: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 28 / 22,
      fontStyle: FontStyle.normal,
    ),
    headline5: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      height: 28 / 22,
      fontStyle: FontStyle.normal,
    ),
    headline6: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 24 / 18,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: neutralSwatch.shade400,
      height: 24 / 16,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.1,
    ),
    subtitle2: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: neutralVariantSwatch.shade400,
      height: 24 / 16,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.1,
    ),
    bodyText1: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: neutralSwatch.shade400,
      height: 20 / 14,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.25,
    ),
    button: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: neutralSwatch.shade400,
      height: 20 / 14,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.1,
    ),
    caption: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: primarySwatch.shade200,
      letterSpacing: 0.4,
      height: 16 / 12,
    ),
    bodyText2: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 18 / 12,
    ),
    overline: TextStyle(
      fontFamily: poppinsFontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      letterSpacing: 0.5,
      height: 16 / 11,
    ),
  ),
);

Color greenBackgroundColor = const Color(0xFF00B576);
