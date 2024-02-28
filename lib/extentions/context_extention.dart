import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextEx on BuildContext {
  AppLocalizations get l18n => AppLocalizations.of(this)!;

  Future<T?> navigate<T>(Widget widget) {
    return Navigator.of(this).push<T?>(
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
