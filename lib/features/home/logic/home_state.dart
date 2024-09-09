part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccessLoad extends HomeState {
  final List<Platform> platforms;
  const HomeSuccessLoad(this.platforms);
  @override
  List<Object> get props => [platforms];
}
final class HomeFailedLoad extends HomeState {
  final String message;
  const HomeFailedLoad({required this.message});
  @override
  List<Object> get props => [message];
}
final class SearchState extends HomeState {
  final List<Platform> platforms;
  const SearchState(this.platforms);
  @override
  List<Object> get props => [platforms, platforms.length];
}
final class RefreshState extends HomeState {
  final List<Platform> platforms;
  final DateTime lastRefresh;
  const RefreshState(this.platforms, this.lastRefresh);
  @override
  List<Object> get props => [platforms, lastRefresh];
}