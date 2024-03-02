String baseUrl='http://accountsprotector.somee.com/api/';
enum EndPoints{
  Register('User/Register'),
  Login('User/Login');


  final String path;
  const EndPoints(this.path);
}
