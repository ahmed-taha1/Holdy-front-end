part of 'platforms_cubit.dart';

abstract class PlatformsState extends Equatable {
  const PlatformsState();
  @override
  List<Object> get props => [];
}

class PlatformsInitial extends PlatformsState {}
class loadingState extends PlatformsState {}
class DataFetchSuccess extends PlatformsState {}
class SearchPlatformState extends PlatformsState {
  final List<Platform> filteredPlatforms;
  const SearchPlatformState({required this.filteredPlatforms});
  @override
  List<Object> get props => [filteredPlatforms];
}
class DataFetchFailure extends PlatformsState {
  final String errorMessage;
  const DataFetchFailure({required this.errorMessage});
}
class PlatformCreateSuccess extends PlatformsState {}
class PlatformCreateFailure extends PlatformsState {
  final String errorMessage;
  const PlatformCreateFailure({required this.errorMessage});
}
class PlatformDeleteSuccess extends PlatformsState {
  final int platformId;
  const PlatformDeleteSuccess({required this.platformId});
  @override
  List<Object> get props => [platformId];
}
class PlatformDeleteFailure extends PlatformsState {
  final String errorMessage;
  const PlatformDeleteFailure({required this.errorMessage});
}
class PlatformUpdateSuccess extends PlatformsState {}
class PlatformUpdateFailure extends PlatformsState {
  final String errorMessage;
  const PlatformUpdateFailure({required this.errorMessage});
}
class ChangeNumOfAccountsState extends PlatformsState {
  final int platformId;
  final int numOfAccounts;
  const ChangeNumOfAccountsState({required this.platformId, required this.numOfAccounts});
  @override
  List<Object> get props => [platformId, numOfAccounts];
}