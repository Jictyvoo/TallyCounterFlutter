import 'dart:ui';

extension LocaleNamesHelper on Locale {
  String get fullLanguageCode {
    switch (languageCode) {
      case 'en':
        return '${languageCode}_${countryCode ?? "US"}';

      case 'pt':
        return '${languageCode}_${countryCode ?? "BR"}';
    }
    return '';
  }

  String get fullName {
    switch (languageCode) {
      case 'en':
        return 'English';

      case 'pt':
        if (countryCode?.toUpperCase() == 'BR') {
          return 'Portuguese (Brazil)';
        }
        return 'Portuguese';
    }
    return '';
  }

  String get nativeName {
    switch (languageCode) {
      case 'en':
        return 'English';

      case 'pt':
        if (countryCode?.toUpperCase() == 'BR') {
          return 'Português (Brasil)';
        }
        return 'Português';
    }
    return '';
  }
}
