part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class LoadedThemeState extends ThemeState {
  final ThemeData theme;

  const LoadedThemeState(this.theme);

  @override
  List<Object> get props => [theme];
}
