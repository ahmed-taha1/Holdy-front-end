part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}
class LogoutSuccess extends SettingsState {
  final DateTime time;
  const LogoutSuccess({required this.time});
  @override
  List<Object> get props => [time];
}
class DarkModeChanged extends SettingsState {
  final bool isDark;
  const DarkModeChanged(this.isDark);
  @override
  List<Object> get props => [isDark];
}

class ReportBugLoading extends SettingsState {}
class ReportBugSuccess extends SettingsState {}
class ReportBugFailed extends SettingsState {
  final String message;
  const ReportBugFailed({required this.message});
  @override
  List<Object> get props => [message];
}