import 'package:accounts_protector/core/di/get_it.dart';
import 'package:accounts_protector/features/platforms/data/dto/platforms_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/failures/i_failure.dart';
import '../../../../core/models/platform.dart';
import '../../../../core/models/user_model.dart';
import '../../data/repo/i_platform_repo.dart';

part 'platforms_state.dart';

class PlatformsCubit extends Cubit<PlatformsState> {
  PlatformsCubit() : super(PlatformsInitial()){
    getAllUserData();
  }
  UserModel? userModel;
  List<Platform>? filteredPlatforms;
  Color selectedColor = Colors.blue;


  Future<void> getAllUserData() async {
    emit(PlatformLoadingState());
    try {
      userModel = await getIt<IPlatformRepo>().getAllUserData();
      emit(DataFetchSuccess());
    } catch (e) {
      if (e is Failure) {
        emit(
          DataFetchFailure(errorMessage: e.message),
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

  void searchPlatform(String searchQuery) {
    if (searchQuery == "") {
      emit(DataFetchSuccess());
    } else {
      filteredPlatforms = userModel?.platforms!
          .where((element) => element.platformName!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
      emit(SearchPlatformState(filteredPlatforms: filteredPlatforms!));
    }
  }

  Future<void> createPlatform(String platformName, String iconColor) async {
    emit(PlatformLoadingState());
    try {
      int id = await getIt<IPlatformRepo>().createPlatform(platformName, iconColor);
      Platform newPlatform = Platform(
        platformId: id,
        platformName: platformName,
        iconColor: iconColor,
      );
      userModel?.platforms?.add(newPlatform);
      emit(PlatformCreateSuccess());
    } catch (e) {
      if (e is Failure) {
        emit(
          PlatformCreateFailure(errorMessage: e.message),
        );
      } else {
        emit(
          const PlatformCreateFailure(
            errorMessage: 'Something went wrong! Please try again later.',
          ),
        );
      }
    }
  }

  Future<void> deletePlatform(int platformId) async {
    emit(PlatformLoadingState());
    try {
      await getIt<IPlatformRepo>().deletePlatform(platformId);
      userModel?.platforms
          ?.removeWhere((element) => element.platformId == platformId);
      emit(PlatformDeleteSuccess(platformId: platformId));
    } catch (e) {
      if (e is Failure) {
        emit(
          PlatformDeleteFailure(errorMessage: e.message),
        );
      } else {
        emit(
          const PlatformDeleteFailure(
            errorMessage: 'Something went wrong! Please try again later.',
          ),
        );
      }
    }
  }

  Future<void> updatePlatform(int platformId, String platformName) async {
    emit(PlatformLoadingState());
    try {
      UpdatePlatformDto updatePlatformDto = UpdatePlatformDto(
        platformId: platformId,
        platformName: platformName,
        iconColor: selectedColor.value.toRadixString(16),
      );
      await getIt<IPlatformRepo>().updatePlatform(updatePlatformDto);
      Platform? p = userModel?.platforms
          ?.firstWhere((element) => element.platformId == platformId);
      p?.platformName = platformName;
      p?.iconColor = selectedColor.value.toRadixString(16);
      emit(PlatformUpdateSuccess());
    } catch (e) {
      if (e is Failure) {
        emit(
          PlatformUpdateFailure(errorMessage: e.message),
        );
      } else {
        emit(
          const PlatformUpdateFailure(
            errorMessage: 'Something went wrong! Please try again later.',
          ),
        );
      }
    }
  }

  void changePlatformNumOfAccounts(int platformId, int numOfAccounts) {
    emit(ChangeNumOfAccountsState(platformId: platformId, numOfAccounts: numOfAccounts));
  }
}
