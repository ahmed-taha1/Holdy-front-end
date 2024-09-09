import 'dart:async';
import 'package:accounts_protector/core/events/events.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/failures/server_failure.dart';
import '../../../core/models/platform.dart';
import '../../../core/models/user_model.dart';
import '../data/i_home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IHomeRepo _homeRepo;
  late UserModel userModel;
  StreamSubscription? _subscription;

  HomeCubit(this._homeRepo) : super(HomeInitial()) {
    _subscription = eventBus.on<RefreshHomeEvent>().listen((event) {
      if (!isClosed) {
        refresh();
      }
    });
  }

  Future<void> fetchUserData() async {
    emit(HomeLoading());
    try {
      userModel = await _homeRepo.fetchUserData();
      emit(HomeSuccessLoad(userModel.platforms!));
    } catch (e) {
      if (e is ServerFailure) {
        emit(HomeFailedLoad(message: e.message));
      } else {
        emit(HomeFailedLoad(message: e.toString()));
      }
    }
  }

  void search(String query) {
    final searchResults = userModel.platforms
        ?.where((element) =>
            element.platformName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchState(searchResults ?? []));
  }

  void refresh() {
    emit(RefreshState(userModel.platforms!, DateTime.now()));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
