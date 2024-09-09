part of 'platform_cubit.dart';

abstract class PlatformState extends Equatable {
  const PlatformState();
  @override
  List<Object> get props => [];
}

class PlatformInitial extends PlatformState {}
class SearchPlatformState extends PlatformState {
  final String searchQuery;
  final List<Account> accounts;
  const SearchPlatformState({required this.searchQuery, required this.accounts});
  @override
  List<Object> get props => [searchQuery];
}
class PlatformRefreshState extends PlatformState {
  final DateTime dateTime;
  const PlatformRefreshState({required this.dateTime});
  @override
  List<Object> get props => [dateTime];
}