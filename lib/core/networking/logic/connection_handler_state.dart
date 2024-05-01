part of 'connection_handler_bloc.dart';

abstract class ConnectionHandlerState extends Equatable {
  const ConnectionHandlerState();
  @override
  List<Object> get props => [];
}

class ConnectionHandlerInitial extends ConnectionHandlerState {}

class ConnectedState extends ConnectionHandlerState {}
class NotConnectedState extends ConnectionHandlerState {}