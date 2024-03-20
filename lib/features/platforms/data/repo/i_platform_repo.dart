import 'package:accounts_protector/core/models/user_model/user_model.dart';

abstract class IPlatformRepo {
  Future<UserModel> getAllUserData();
}