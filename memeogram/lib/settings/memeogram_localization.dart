import 'package:flutter/material.dart';

class MemeogramLocalizationDelegate
    extends LocalizationsDelegate<MemeogramLocalization> {
  const MemeogramLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['de'].contains(locale.languageCode);

  @override
  Future<MemeogramLocalization> load(Locale locale) =>
      MemeogramLocalization.load(locale);

  @override
  bool shouldReload(MemeogramLocalizationDelegate old) => false;
}

class MemeogramLocalization {
  final String localeName;

  MemeogramLocalization(this.localeName);

  static Future<MemeogramLocalization> load(Locale locale) async {
    // final String localeName = Intl.canonicalizedLocale(locale.languageCode);
    //
    // return initializeMessages(localeName)
    //     .then((_) => ArticleAdjustmentLocalization(localeName));
  }

  static MemeogramLocalization of(BuildContext context) {
    return Localizations.of<MemeogramLocalization>(
        context, MemeogramLocalization);
  }
}
