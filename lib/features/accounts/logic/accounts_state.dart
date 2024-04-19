part of 'accounts_cubit.dart';

abstract class AccountsState extends Equatable {
  const AccountsState();
  @override
  List<Object> get props => [];
}

class AccountsInitial extends AccountsState {}
class TextFieldCreated extends AccountsState {
  final List<Pair> controllers;
  final int size;
  const TextFieldCreated(this.controllers, this.size);
  @override
  List<Object> get props => [controllers, size];
}
class TextFieldDeleted extends AccountsState {
  final int size;
  const TextFieldDeleted(this.size);
  @override
  List<Object> get props => [size];
}
class AccountDeletedState extends AccountsState {
  final int accountId;
  const AccountDeletedState(this.accountId);
  @override
  List<Object> get props => [accountId];
}
class AccountUpdatedState extends AccountsState {}
class AccountLoadingState extends AccountsState {}
class CreateAccountSuccess extends AccountsState {}
class AccountSearchState extends AccountsState {
  final String query;
  const AccountSearchState(this.query);
  @override
  List<Object> get props => [query];
}
class FailedState extends AccountsState {
  final String errorMessage;
  const FailedState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
class UpdatePlatformState extends AccountsState {}