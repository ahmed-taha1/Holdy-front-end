import 'package:accounts_protector/core/models/platform.dart';
import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import '../../../../core/networking/urls.dart';
import '../../../../core/session_db/session_db.dart';
import '../dto/platforms_dto.dart';
import 'i_platform_repo.dart';

class PlatformRepo implements IPlatformRepo {
  final ApiService _apiService;
  final SessionDb _sessionDb;

  PlatformRepo(this._apiService, this._sessionDb);

  @override
  Future<int> createPlatform(String platformName, String iconColor) async {
    try {
      var response = await _apiService.post(
        path: Urls.createPlatform,
        token: CacheService.getData(
          key: CacheServiceConstants.token,
        ),
        body: {
          "platformName": platformName,
          "iconColor": iconColor,
        },
      );

      _sessionDb.insertPlatform(
        Platform(
          platformId: response.data['platformId'],
          platformName: platformName,
          iconColor: iconColor,
        ),
      );
      return response.data['platformId'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deletePlatform(int platformId) async {
    try {
      await _apiService.delete(
        path: Urls.deletePlatform,
        token: CacheService.getData(
          key: CacheServiceConstants.token,
        ),
        body: {
          "id": platformId,
        },
      );
      _sessionDb.removePlatform(platformId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updatePlatform(UpdatePlatformDto updatePlatformDto) async {
    try {
      await _apiService.put(
        path: Urls.updatePlatform,
        token: CacheService.getData(
          key: CacheServiceConstants.token,
        ),
        body: updatePlatformDto.toMap(),
      );
      _sessionDb.updatePlatform(updatePlatformDto.platformId, Platform(
        platformId: updatePlatformDto.platformId,
        platformName: updatePlatformDto.platformName,
        iconColor: updatePlatformDto.iconColor,
      ));
    } catch (e) {
      rethrow;
    }
  }
}
