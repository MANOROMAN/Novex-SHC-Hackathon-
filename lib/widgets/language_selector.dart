import 'package:flutter/material.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import '../main.dart';
import '../theme/app_theme.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  Locale _currentLocale = const Locale('tr');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final l10n = AppLocalizations.of(context);
    if (l10n != null) {
      final locale = Localizations.localeOf(context);
      if (locale != _currentLocale) {
        setState(() {
          _currentLocale = locale;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return PopupMenuButton<Locale>(
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF192633) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.3),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _getFlagEmoji(_currentLocale.languageCode),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 8),
            Text(
              _getLanguageCode(_currentLocale.languageCode),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppTheme.getBrandPrimaryColor(context),
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_drop_down,
              color: AppTheme.getBrandPrimaryColor(context),
              size: 20,
            ),
          ],
        ),
      ),
      onSelected: (Locale locale) {
        _changeLanguage(context, locale);
      },
      itemBuilder: (BuildContext context) => [
        _buildLanguageItem(context, const Locale('tr'), 'Türkçe', 'TR', _currentLocale),
        _buildLanguageItem(context, const Locale('en'), 'English', 'EN', _currentLocale),
        _buildLanguageItem(context, const Locale('de'), 'Deutsch', 'DE', _currentLocale),
        _buildLanguageItem(context, const Locale('it'), 'Italiano', 'IT', _currentLocale),
        _buildLanguageItem(context, const Locale('es'), 'Español', 'ES', _currentLocale),
        _buildLanguageItem(context, const Locale('ru'), 'Русский', 'RU', _currentLocale),
        _buildLanguageItem(context, const Locale('ar'), 'العربية', 'AR', _currentLocale),
        _buildLanguageItem(context, const Locale('fr'), 'Français', 'FR', _currentLocale),
        _buildLanguageItem(context, const Locale('sq'), 'Shqip', 'SQ', _currentLocale),
        _buildLanguageItem(context, const Locale('he'), 'עברית', 'HE', _currentLocale),
        _buildLanguageItem(context, const Locale('pt'), 'Português', 'PT', _currentLocale),
      ],
    );
  }

  String _getFlagEmoji(String code) {
    final flags = {
      'tr': '🇹🇷',
      'en': '🇬🇧',
      'de': '🇩🇪',
      'it': '🇮🇹',
      'es': '🇪🇸',
      'ru': '🇷🇺',
      'ar': '🇸🇦',
      'fr': '🇫🇷',
      'sq': '🇦🇱',
      'he': '🇮🇱',
      'pt': '🇵🇹',
    };
    return flags[code] ?? '🌐';
  }

  void _changeLanguage(BuildContext context, Locale locale) {
    // Dil değişikliğini kaydet ama navigasyon yapma
    final appState = SelfCaptureApp.navigatorKey.currentState;
    if (appState != null) {
      appState.setLocale(locale);
    }
    setState(() {
      _currentLocale = locale;
    });
    // Navigator'ı sıfırlama - sadece locale'i güncelle
  }

  PopupMenuEntry<Locale> _buildLanguageItem(
    BuildContext context,
    Locale locale,
    String name,
    String code,
    Locale currentLocale,
  ) {
    final isSelected = locale.languageCode == currentLocale.languageCode;
    return PopupMenuItem<Locale>(
      value: locale,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              _getFlagEmoji(locale.languageCode),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected
                      ? AppTheme.getBrandPrimaryColor(context)
                      : AppTheme.getTextPrimaryColor(context),
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppTheme.getBrandPrimaryColor(context),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  String _getLanguageCode(String code) {
    final codes = {
      'tr': 'TR',
      'en': 'EN',
      'de': 'DE',
      'it': 'IT',
      'es': 'ES',
      'ru': 'RU',
      'ar': 'AR',
      'fr': 'FR',
      'sq': 'SQ',
      'he': 'HE',
      'pt': 'PT',
    };
    return codes[code] ?? code.toUpperCase();
  }
}



