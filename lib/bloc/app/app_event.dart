part of 'app_bloc.dart';

sealed class AppEvents extends Equatable {
  const AppEvents();

  @override
  List<Object?> get props => [];
}

class UpdateTheme extends AppEvents {
  final ThemeMode? theme;

  const UpdateTheme({required this.theme});

  @override
  // TODO: implement props
  List<Object?> get props => [theme];
}

class GetTheme extends AppEvents {}
