import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/events/events.dart';
import '../../../core/failures/i_failure.dart';
import '../../../core/models/platform.dart';
import '../../../core/theming/app_colors.dart';
import '../data/dto/platforms_dto.dart';
import '../data/repo/i_platform_repo.dart';

part 'platform_crud_state.dart';

class PlatformCrudCubit extends Cubit<PlatformCrudState> {
  final IPlatformRepo _platformRepo;
  late Platform platform;
  Color selectedColor = AppColors.purple;
  TextEditingController platformNameController = TextEditingController();

  PlatformCrudCubit(this._platformRepo) : super(PlatformCrudInitial());

  Future<void> createPlatform() async {
    try {
      emit(PlatformCrudLoadingState());
      String iconColor = selectedColor.value.toRadixString(16);
      String platformName = platformNameController.text;
      await _platformRepo.createPlatform(platformName, iconColor);

      eventBus.fire(RefreshHomeEvent());
      emit(PlatformCrudCreateSuccess());
    } catch (e) {
      String errorMessage = 'Something went wrong! Please try again later.';
      if (e is Failure) {
        errorMessage = e.message;
      }
      emit(PlatformCrudCreateFailure(errorMessage: errorMessage));
    }
  }

  setPlatform(Platform platform) {
    this.platform = platform;
    platformNameController.text = platform.platformName!;
    selectedColor = Color(int.parse(platform.iconColor!, radix: 16));
  }

  Future<void> deletePlatform() async {
    try {
      emit(PlatformCrudLoadingState());
      await _platformRepo.deletePlatform(platform.platformId!);
      emit(PlatformCrudDeleteSuccess(platformId: platform.platformId!));
      eventBus.fire(RefreshHomeEvent());
      eventBus.fire(RefreshPlatformEvent());
    } catch (e) {
      String errorMessage = 'Something went wrong! Please try again later.';
      if (e is Failure) {
        errorMessage = e.message;
      }
      emit(PlatformCrudDeleteFailure(errorMessage: errorMessage));
    }
  }

  Future<void> updatePlatform() async {
    try {
      emit(PlatformCrudLoadingState());
      UpdatePlatformDto updatePlatformDto = UpdatePlatformDto(
        platformId: platform.platformId!,
        platformName: platformNameController.text,
        iconColor: selectedColor.value.toRadixString(16),
      );
      await _platformRepo.updatePlatform(updatePlatformDto);
      // Platform? p = userModel?.platforms
      //     ?.firstWhere((element) => element.platformId == platformId);
      // p?.platformName = platformName;
      // p?.iconColor = selectedColor.value.toRadixString(16);
      emit(PlatformCrudUpdateSuccess());
      eventBus.fire(RefreshHomeEvent());
      eventBus.fire(RefreshPlatformEvent());
    } catch (e) {
      String errorMessage = 'Something went wrong! Please try again later.';
      if (e is Failure) {
        errorMessage = e.message;
      }
      emit(PlatformCrudUpdateFailure(errorMessage: errorMessage));
    }
  }

  @override
  Future<void> close() {
    platformNameController.dispose();
    return super.close();
  }
}
