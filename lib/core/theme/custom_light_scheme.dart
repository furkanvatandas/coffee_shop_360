import 'package:coffee_shop_360/core/theme/custom_colors.dart';
import 'package:coffee_shop_360/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLightTheme implements CustomTheme {
  ColorScheme _lightScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: CustomColors.orangeSalmon,
      surfaceTint: const Color(0xff8d4e24),
      onPrimary: const Color(0xffffffff),
      primaryContainer: const Color(0xffa86338),
      onPrimaryContainer: const Color(0xffffffff),
      secondary: const Color(0xff665c5c),
      onSecondary: const Color(0xffffffff),
      secondaryContainer: const Color(0xfffff2f2),
      onSecondaryContainer: const Color(0xff5a5051),
      tertiary: const Color(0xff9f1520),
      onTertiary: const Color(0xffffffff),
      tertiaryContainer: const Color(0xffd33e40),
      onTertiaryContainer: const Color(0xffffffff),
      error: const Color(0xffba1a1a),
      onError: const Color(0xffffffff),
      errorContainer: const Color(0xffffdad6),
      onErrorContainer: const Color(0xff410002),
      surface: CustomColors.snowDrift,
      onSurface: const Color(0xff1c1b1b),
      surfaceContainerHighest: const Color(0xffe0e3e3),
      onSurfaceVariant: const Color(0xff444748),
      outline: const Color(0xff747878),
      outlineVariant: const Color(0xffc4c7c8),
      shadow: const Color(0xff000000),
      scrim: const Color(0xff000000),
      inverseSurface: const Color(0xff313030),
      inversePrimary: const Color(0xffffb68c),
    );
  }

  @override
  ThemeData setTheme(BuildContext context) {
    return ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.soraTextTheme().copyWith(
          labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: CustomColors.thunder,
              ),
          labelMedium: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: CustomColors.thunder,
              ),
          labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: CustomColors.thunder,
              ),
          bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: CustomColors.thunder,
              ),
          bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: CustomColors.thunder,
              ),
          bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: CustomColors.thunder,
              ),
          titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: CustomColors.thunder,
              ),
          titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: CustomColors.thunder,
              ),
          titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: CustomColors.thunder,
              ),
        ),
        colorScheme: _lightScheme(),
        cardTheme: Theme.of(context).cardTheme.copyWith(color: Colors.white));
  }
}
