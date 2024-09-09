import 'package:accounts_protector/core/models/account.dart';
import 'package:accounts_protector/core/networking/urls.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import '../../../core/session_db/session_db.dart';
import 'i_accounts_repo.dart';

class AccountRepo implements IAccountsRepo {
  final ApiService _apiService;
  final SessionDb _sessionDb;

  AccountRepo(this._apiService, this._sessionDb);

  @override
  Future<int> createAccount(Account account) async {
    try {
      var response = await _apiService.post(
          path: Urls.createAccount, body: account.toMap());

      account.accountId = response.data['accountId'];
      _sessionDb.insertPlatformAccount(account.platformId!, account);

      return response.data['accountId'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAccount(Account account) async {
    try {
      await _apiService.delete(
          path: Urls.deleteAccount, body: {'accountId': account.accountId});
      _sessionDb.deletePlatformAccount(
          account.platformId!, account.accountId!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateAccount(Account account) async {
    try {
      await _apiService.put(path: Urls.updateAccount, body: account.toMap());
      _sessionDb.updatePlatformAccount(account.platformId!, account.accountId!, account);
    } catch (e) {
      rethrow;
    }
  }
}
