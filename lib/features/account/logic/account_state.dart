part of 'account_cubit.dart';

sealed class AccountState extends Equatable {
  @override
  List<Object> get props => [];
  const AccountState();
}

final class AccountInitial extends AccountState {}
final class AccountRefreshState extends AccountState {
  final DateTime updateTime;
  const AccountRefreshState(this.updateTime);
  @override
  List<Object> get props => [updateTime];
}

class ShowAttributeState extends AccountState {
  final AccountAttributeForUi attribute;
  const ShowAttributeState(this.attribute);
  @override
  List<Object> get props => [attribute.value, attribute.isHidden, attribute.key];
}