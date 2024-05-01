part of 'connection_handler_bloc.dart';

abstract class ConnectionHandlerEvent extends Equatable {
  const ConnectionHandlerEvent();
  @override
  List<Object> get props => [];
}

class OnConnected extends ConnectionHandlerEvent {}

class OnNotConnected extends ConnectionHandlerEvent {}