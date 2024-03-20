import 'package:accounts_protector/core/errors/failures.dart';
import 'package:accounts_protector/core/models/user_model/user_model.dart';
import 'package:accounts_protector/features/platforms/data/repo/platform_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'platforms_state.dart';

class PlatformsCubit extends Cubit<PlatformsState> {
  PlatformsCubit() : super(PlatformsInitial());
  UserModel? userModel;

  void getAllUserData() async {
    emit(DataFetchInProgress());
    try {
      userModel = await PlatformRepo().getAllUserData();
      emit(DataFetchSuccess());
    } catch (e) {
      if (e is ServerFailure) {
        emit(
          DataFetchFailure(errorMessage: e.errorMassage),
        );
      } else {
        emit(
          const DataFetchFailure(
            errorMessage: 'Something went wrong! Please try again later.',
          ),
        );
      }
    }
  }
}
