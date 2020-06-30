
abstract class Presenter{
  void login(String email, String password);
}

abstract class LoginView{
  void loginFailed(String msg);
  void loginSuccess(String msg);
}