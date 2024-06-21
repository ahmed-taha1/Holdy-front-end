import 'package:shared_preferences/shared_preferences.dart';

class CacheHelperConstants {
  static const String token = 'token';
  static const String pinHash = 'pinHash';
  static const String key = 'key';
  static const String language = 'language';
  static const String theme = 'theme';
  static const String isDark = 'isDark';
  static const String isLogged = 'isLogged';
  static const String tempPinToken = 'tempPinToken';
  static const String tempOtpToken = 'tempOtpToken';
}

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
    required String key,
    required dynamic value,
  }) {

    if (value is String) return sharedPreferences!.setString(key, value);
    if (value is int) return sharedPreferences!.setInt(key, value);
    if (value is bool) return sharedPreferences!.setBool(key, value);
    return sharedPreferences!.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) {
    return sharedPreferences!.remove(key);
  }

  static void logout() {
    removeData(key: CacheHelperConstants.token);
    removeData(key: CacheHelperConstants.pinHash);
    removeData(key: CacheHelperConstants.isLogged);
    removeData(key: CacheHelperConstants.tempPinToken);
    removeData(key: CacheHelperConstants.tempOtpToken);
    removeData(key: CacheHelperConstants.key);
  }
}