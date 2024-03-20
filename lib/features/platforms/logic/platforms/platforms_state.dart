part of 'platforms_cubit.dart';

abstract class PlatformsState extends Equatable {
  const PlatformsState();
  @override
  List<Object> get props => [];
}

class PlatformsInitial extends PlatformsState {}
class DataFetchInProgress extends PlatformsState {}
class DataFetchSuccess extends PlatformsState {}
class DataFetchFailure extends PlatformsState {
  final String errorMessage;
  const DataFetchFailure({required this.errorMessage});
}