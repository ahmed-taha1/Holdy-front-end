
abstract class IAuthRepo{
  Future<void> login({required String email,required String password});


}