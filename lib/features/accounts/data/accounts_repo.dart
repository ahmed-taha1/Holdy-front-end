import 'package:accounts_protector/core/models/account.dart';
import 'package:accounts_protector/core/networking/urls.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import 'package:accounts_protector/features/accounts/data/i_accounts_repo.dart';

import '../../../core/di/get_it.dart';

class AccountsRepo implements IAccountsRepo {
  @override
  Future<int> createAccount(Account account) async {
    try {
      var response = await getIt<ApiService>()
          .post(path: Urls.createAccount, body: account.toMap());
      return response.data['accountId'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAccount(int accountId) async {
    try {
      await getIt<ApiService>()
          .delete(path: Urls.deleteAccount, body: {'accountId': accountId});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateAccount(Account account) async {
    try {
      await getIt<ApiService>()
          .put(path: Urls.updateAccount, body: account.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
