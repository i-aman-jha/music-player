import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:music/Services/theme_service.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvents, AppState> {
  ThemeService themeService;

  AppBloc(this.themeService) : super(const AppState()) {
    on<UpdateTheme>(_updateTheme);
    on<GetTheme>(_getTheme);
  }

  void _updateTheme(UpdateTheme event, Emitter<AppState> emit) {
    themeService.saveThemeMode(event.theme);
    emit(state.copyWith(theme: event.theme));
  }

  void _getTheme(GetTheme event, Emitter<AppState> emit) async {
    final ThemeMode theme = await themeService.getThemeMode();
    emit(state.copyWith(theme: theme));
  }
}
