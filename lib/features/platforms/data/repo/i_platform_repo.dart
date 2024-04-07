import 'package:accounts_protector/features/platforms/data/dto/platforms_dto.dart';
import '../../../../core/models/user_model.dart';

abstract class IPlatformRepo {
  Future<UserModel> getAllUserData();
  Future<int> createPlatform(String platformName, String iconColor);
  Future<void> deletePlatform(int platformId);
  Future<void> updatePlatform(UpdatePlatformDto updatePlatformDto);
}