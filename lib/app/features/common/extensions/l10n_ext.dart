import 'package:crm_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationExtension on BuildContext {
  // Now you can just type context.l10n.yourKey
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
