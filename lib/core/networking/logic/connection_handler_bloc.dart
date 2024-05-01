import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connection_handler_event.dart';
part 'connection_handler_state.dart';

class ConnectionHandlerBloc extends Bloc<ConnectionHandlerEvent, ConnectionHandlerState> {
  StreamSubscription? _subscription;
  ConnectionHandlerBloc() : super(ConnectionHandlerInitial()) {
    on<ConnectionHandlerEvent>((event, emit) {
      if (event is OnConnected) {
        emit(ConnectedState());
      } else if (event is OnNotConnected) {
        emit(NotConnectedState());
      }
    });

    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi)) {
        add(OnConnected());
      } else {
        add(OnNotConnected());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
