part of 'app_bloc.dart';

class AppState extends Equatable {
  final ThemeMode? theme;

  const AppState({
    this.theme = ThemeMode.system,
  });

  AppState copyWith({ThemeMode? theme}) {
    return AppState(
      theme: theme ?? this.theme,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [theme];
}
