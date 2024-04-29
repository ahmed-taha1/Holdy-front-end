import 'dart:async';

import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:accounts_protector/core/theming/app_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool isDark = false;
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>(
      (event, emit) async {
        if (event is GetCurrentThemeEvent) {
          final String cachedTheme = await getCachedTheme();
          final AppTheme theme = AppTheme.values.firstWhere((element) => element.value == cachedTheme, orElse: () => AppTheme.light);
          if(theme == AppTheme.dark){
            isDark = true;
          }
          emit(LoadedThemeState(appThemeData[theme]!));
        } else if (event is ThemeChangedEvent) {
          final theme = event.theme;
          if(theme == AppTheme.dark){
            isDark = true;
          } else {
            isDark = false;
          }
          emit(LoadedThemeState(appThemeData[theme]!));
          CacheHelper.putData(key: CacheHelperConstants.theme, value: theme.value);
        }
      },
    );
  }

  Future<String> getCachedTheme() async{
    String? cachedTheme = await CacheHelper.getData(key: CacheHelperConstants.theme);
    cachedTheme ??= AppTheme.light.value;
    CacheHelper.putData(key: CacheHelperConstants.theme, value: cachedTheme);
    return cachedTheme;
  }
}
