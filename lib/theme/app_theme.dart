import 'package:flutter/material.dart';

/// Tema modu enum'u
enum AppThemeMode {
  system, // Sistem ayarlarına göre
  light, // Aydınlık tema
  dark, // Karanlık tema
}

class AppTheme {
  // ========== DEFAULT THEME COLORS ==========
  static const Color primaryGreen = Color(0xFF008080); // Güncel marka teal rengi
  static const Color primaryBlue = Color(0xFF135BEC);
  static const Color primaryTeal = Color(0xFF005A6A);
  static const Color primaryNavy = Color(0xFF1C2A39);
  static const Color primaryDark = Color(0xFF005A6A);
  static const Color brandTealPrimary = Color(0xFF008080);
  static const Color brandTealSecondary = Color(0xFF00A8A8);
  static const Color brandMutedSurface = Color(0xFFF5F7FA);
  static const Color brandDeepNavy = Color(0xFF1A2A4D);

  static const Color backgroundLight = Color(0xFFF0F2F5);
  static const Color backgroundDark = Color(0xFF101622);

  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF555555);

  static const Color accentGold = Color(0xFFC0A172);
  static const Color accentTeal = Color(0xFF36A7A7);

  static const Color borderLight = Color(0xFFE0E0E0);

  static const List<Color> premiumDarkGradient1 = [
    Color(0xFF0F172A),
    Color(0xFF1D1C3D),
    Color(0xFF312E81),
  ];

  static const List<Color> vibrantGradient1 = [
    Color(0xFF06B6D4),
    Color(0xFF3B82F6),
    Color(0xFF9333EA),
  ];

  // ========== DEFAULT THEME ==========
  static ThemeData get defaultTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: primaryGreen,
          secondary: primaryTeal,
          surface: Colors.white,
          error: Colors.red.shade600,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: textPrimary,
          onSurfaceVariant: Colors.grey.shade500,
          outline: Colors.grey.shade400,
          shadow: Colors.black.withOpacity(0.1),
        ),
        scaffoldBackgroundColor: backgroundLight,
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: textPrimary,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        fontFamily: 'Manrope',
      );

  static ThemeData get lightTheme => defaultTheme;

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: primaryTeal,
          secondary: primaryTeal,
          surface: const Color(0xFF1E293B),
          error: Colors.red.shade400,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onSurfaceVariant: Colors.grey.shade400,
          outline: Colors.grey.shade700,
          shadow: Colors.black.withOpacity(0.3),
        ),
        scaffoldBackgroundColor: backgroundDark,
        cardColor: const Color(0xFF1E293B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E293B),
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF1E293B),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        fontFamily: 'Manrope',
      );

  static ThemeData getThemeByMode(
      AppThemeMode mode, Brightness? systemBrightness) {
    switch (mode) {
      case AppThemeMode.system:
        return systemBrightness == Brightness.dark ? darkTheme : lightTheme;
      case AppThemeMode.light:
        return lightTheme;
      case AppThemeMode.dark:
        return darkTheme;
    }
  }

  /// Marka birincil rengi
  static Color getBrandPrimaryColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? brandTealSecondary
        : brandTealPrimary;
  }

  /// Marka ikincil rengi
  static Color getBrandSecondaryColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? brandTealSecondary.withOpacity(0.85)
        : brandTealSecondary;
  }

  /// Marka degrade renkleri
  static List<Color> getBrandGradientColors(
    BuildContext context, {
    bool subtle = false,
  }) {
    final primary = getBrandPrimaryColor(context);
    final secondary = getBrandSecondaryColor(context);
    if (subtle) {
      return [
        primary.withOpacity(0.85),
        secondary.withOpacity(0.85),
      ];
    }
    return [primary, secondary];
  }

  /// Marka degrade nesnesi
  static LinearGradient buildBrandGradient(
    BuildContext context, {
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
    bool subtle = false,
  }) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: getBrandGradientColors(context, subtle: subtle),
    );
  }

  static LinearGradient buildHeroGradient(
    BuildContext context, {
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) {
    final brightness = Theme.of(context).brightness;
    final colors = brightness == Brightness.dark
        ? [const Color(0xFF101828), const Color(0xFF1F2942)]
        : [brandDeepNavy, const Color(0xFF2C3E50)];
    return LinearGradient(
      begin: begin,
      end: end,
      colors: colors,
    );
  }

  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  static Color getSecondaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  static Color getSurfaceColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  static Color getTextPrimaryColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return colorScheme.onSurface;
  }

  static Color getTextSecondaryColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return colorScheme.onSurfaceVariant;
  }

  static Color getCardColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return colorScheme.surfaceContainerHighest;
  }

  static Color getMutedSurfaceColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? Theme.of(context).colorScheme.surfaceContainerHighest
        : brandMutedSurface;
  }

  static Color getElevatedSurfaceColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const Color(0xFF1F2A3C)
        : Colors.white;
  }

  static Color getBorderColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    if (brightness == Brightness.dark) {
      return colorScheme.outline.withOpacity(0.6);
    }
    return colorScheme.outline.withOpacity(0.3);
  }

  static Color getErrorColor(BuildContext context) {
    return Theme.of(context).colorScheme.error;
  }

  static Color getSuccessColor(BuildContext context) {
    return Colors.green.shade600;
  }

  static Color getShadowColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? Colors.black.withOpacity(0.35)
        : Colors.black.withOpacity(0.08);
  }

  static Brightness getBrightness(BuildContext context) {
    return Theme.of(context).brightness;
  }
}
