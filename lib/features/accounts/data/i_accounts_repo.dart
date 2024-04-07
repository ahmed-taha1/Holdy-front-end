import '../../../core/models/account.dart';

abstract class IAccountsRepo {
  // Future<List<Account>> getAccounts();
  Future<int> createAccount(Account account);
  Future<void> updateAccount(Account account);
  Future<void> deleteAccount(int accountId);
}