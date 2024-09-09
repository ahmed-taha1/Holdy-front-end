part of 'platform_crud_cubit.dart';

abstract class PlatformCrudState extends Equatable {
  const PlatformCrudState();
  @override
  List<Object> get props => [];
}

class PlatformCrudInitial extends PlatformCrudState {}
class PlatformCrudLoadingState extends PlatformCrudState {}
class PlatformCrudCreateSuccess extends PlatformCrudState {}
class PlatformCrudCreateFailure extends PlatformCrudState {
  final String errorMessage;
  const PlatformCrudCreateFailure({required this.errorMessage});
}
class PlatformCrudDeleteSuccess extends PlatformCrudState {
  final int platformId;
  const PlatformCrudDeleteSuccess({required this.platformId});
  @override
  List<Object> get props => [platformId];
}
class PlatformCrudDeleteFailure extends PlatformCrudState {
  final String errorMessage;
  const PlatformCrudDeleteFailure({required this.errorMessage});
}
class PlatformCrudUpdateSuccess extends PlatformCrudState {}
class PlatformCrudUpdateFailure extends PlatformCrudState {
  final String errorMessage;
  const PlatformCrudUpdateFailure({required this.errorMessage});
}
