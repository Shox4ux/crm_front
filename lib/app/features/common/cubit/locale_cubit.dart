import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:crm_app/app_storage.dart';

class LocaleCubit extends Cubit<Locale> {
  final AppStorage _storage;

  LocaleCubit(this._storage) : super(const Locale('en')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final languageCode = await _storage.getLanguageCode();
    if (languageCode != null && languageCode.isNotEmpty) {
      emit(Locale(languageCode));
    }
  }

  Future<void> changeLocale(Locale locale) async {
    if (state.languageCode == locale.languageCode) return;
    await _storage.setLanguageCode(locale.languageCode);
    emit(locale);
  }
}
