import '../../../core/models/user_model.dart';

abstract class ISettingsRepo{
  void reportBug(String message);
  UserModel cloneUserData();
  void clearUserData();
}