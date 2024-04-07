import 'package:accounts_protector/core/di/get_it.dart';
import 'package:accounts_protector/core/errors/failures.dart';
import 'package:accounts_protector/features/platforms/data/dto/platforms_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/models/platform.dart';
import '../../../../core/models/user_model.dart';
import '../../data/repo/i_platform_repo.dart';

part 'platforms_state.dart';

class PlatformsCubit extends Cubit<PlatformsState> {
  PlatformsCubit() : super(PlatformsInitial());
  UserModel? userModel;
  List<Platform>? filteredPlatforms;
  bool isLoading = false;
  Color selectedColor = Colors.blue;

  Future<void> getAllUserData() async {
    emit(LoadingState());
    try {
      userModel = await getIt<IPlatformRepo>().getAllUserData();
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
    isLoading = true;
    emit(LoadingState());
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
      if (e is ServerFailure) {
        emit(
          PlatformCreateFailure(errorMessage: e.errorMassage),
        );
      } else {
        emit(
          const PlatformCreateFailure(
            errorMessage: 'Something went wrong! Please try again later.',
          ),
        );
      }
    }
    isLoading = false;
  }

  Future<void> deletePlatform(int platformId) async {
    isLoading = true;
    emit(LoadingState());
    try {
      await getIt<IPlatformRepo>().deletePlatform(platformId);
      userModel?.platforms
          ?.removeWhere((element) => element.platformId == platformId);
      emit(PlatformDeleteSuccess(platformId: platformId));
    } catch (e) {
      if (e is ServerFailure) {
        emit(
          PlatformDeleteFailure(errorMessage: e.errorMassage),
        );
      } else {
        emit(
          const PlatformDeleteFailure(
            errorMessage: 'Something went wrong! Please try again later.',
          ),
        );
      }
    }
    isLoading = false;
  }

  Future<void> updatePlatform(int platformId, String platformName) async {
    isLoading = true;
    emit(LoadingState());
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
      if (e is ServerFailure) {
        emit(
          PlatformUpdateFailure(errorMessage: e.errorMassage),
        );
      } else {
        emit(
          const PlatformUpdateFailure(
            errorMessage: 'Something went wrong! Please try again later.',
          ),
        );
      }
    }
    isLoading = false;
  }

  void changePlatformNumOfAccounts(int platformId, int numOfAccounts) {
    emit(ChangeNumOfAccountsState(platformId: platformId, numOfAccounts: numOfAccounts));
  }
}
