part of 'account_crud_cubit.dart';

abstract class AccountCrudState extends Equatable {
  const AccountCrudState();
  @override
  List<Object> get props => [];
}

class AccountsInitial extends AccountCrudState {}
class TextFieldCreated extends AccountCrudState {
  final List<TextControllerAttribute> controllers;
  final int size;
  const TextFieldCreated(this.controllers, this.size);
  @override
  List<Object> get props => [controllers, size];
}
class TextFieldDeleted extends AccountCrudState {
  final int size;
  const TextFieldDeleted(this.size);
  @override
  List<Object> get props => [size];
}
class AccountDeletedState extends AccountCrudState {
  final int accountId;
  const AccountDeletedState(this.accountId);
  @override
  List<Object> get props => [accountId];
}
class AccountUpdatedState extends AccountCrudState {}
class AccountLoadingState extends AccountCrudState {}
class CreateAccountSuccess extends AccountCrudState {}
class FailedState extends AccountCrudState {
  final String errorMessage;
  const FailedState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
class MarkAsSensitiveState extends AccountCrudState {
  final int index;
  final bool isSensitive;
  const MarkAsSensitiveState(this.index, this.isSensitive);
  @override
  List<Object> get props => [index, isSensitive];
}