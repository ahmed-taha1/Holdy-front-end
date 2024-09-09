import 'package:accounts_protector/core/models/user_model.dart';

abstract class IHomeRepo {
  Future<UserModel> fetchUserData();
}