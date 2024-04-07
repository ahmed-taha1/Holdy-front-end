part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}
class LogoutSuccess extends SettingsState {}
class DarkModeChanged extends SettingsState {
  final bool isDark;
  const DarkModeChanged(this.isDark);
  @override
  List<Object> get props => [isDark];
}
