import 'package:accounts_protector/core/models/account.dart';
import 'package:accounts_protector/core/models/user_model.dart';
import '../models/platform.dart';

class SessionDb {
  static final SessionDb instance = SessionDb._privateConstructor();

  SessionDb._privateConstructor();

  UserModel? _userModel;

  UserModel? getUserModel() => _userModel;

  void setUserModel(UserModel userModel) => _userModel = userModel;

  void clearUserModel() => _userModel = null;

  // user info
  String? getUserName() => _userModel?.firstName;

  String? getUserEmail() => _userModel?.email;

  String? getUserPhoneNumber() => _userModel?.phoneNumber;

  void setUserName(String name) => _userModel?.firstName = name;

  void updateUserEmail(String email) => _userModel?.email = email;

  void updateUserPhoneNumber(String phoneNumber) =>
      _userModel?.phoneNumber = phoneNumber;

  // platforms
  List<Platform>? getPlatforms() => _userModel?.platforms;

  void updatePlatform(int platformId, Platform platform) {
    int index = _userModel?.platforms
            ?.indexWhere((element) => element.platformId == platformId) ??
        -1;
    if (index != -1) {
      _userModel?.platforms?[index].platformName = platform.platformName;
      _userModel?.platforms?[index].iconColor = platform.iconColor;
    }
  }

  void insertPlatform(Platform platform) =>
      _userModel?.platforms?.add(platform);

  void removePlatform(int platformId) => _userModel?.platforms
      ?.removeWhere((element) => element.platformId == platformId);

  // platform accounts
  void updatePlatformAccount(int platformId, int accountId, Account account) {
    Platform? platform = _userModel?.platforms
        ?.firstWhere((element) => element.platformId == platformId);
    int index = platform?.accounts
            ?.indexWhere((element) => element.accountId == accountId) ??
        -1;
    if (index != -1) {
      platform?.accounts?[index].accountName = account.accountName;
      platform?.accounts?[index].accountAttributes = account.accountAttributes;
    }
  }

  void insertPlatformAccount(int platformId, Account account) {
    Platform? platform = _userModel?.platforms
        ?.firstWhere((element) => element.platformId == platformId);
    platform?.accounts?.add(account);
    platform?.numOfAccounts = platform.accounts?.length ?? 0;
  }

  void deletePlatformAccount(int platformId, int accountId) {
    Platform? platform = _userModel?.platforms
        ?.firstWhere((element) => element.platformId == platformId);
    platform?.accounts
        ?.removeWhere((element) => element.accountId == accountId);
    platform?.numOfAccounts = platform.accounts?.length ?? 0;
  }
}
