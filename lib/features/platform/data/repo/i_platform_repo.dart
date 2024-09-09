
import '../dto/platforms_dto.dart';

abstract class IPlatformRepo {
  Future<int> createPlatform(String platformName, String iconColor);
  Future<void> deletePlatform(int platformId);
  Future<void> updatePlatform(UpdatePlatformDto updatePlatformDto);
}