import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:learning_project/src/services/auth_service/auth_service.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  var authService = GetIt.I.get<AuthService>();

  @observable
  bool isLoggedIn = false;

  @observable
  bool isLoginButtonActive = false;

  @observable
  bool isPasswordObscured = true;

  @observable
  bool isUserSignedUp = true;

  @observable
  String? userFieldErrorMessage;

  @observable
  String? passwordFieldErrorMessage;

  @action
  void validateUserField(String user) {
    var userRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!userRegex.hasMatch(user) && user.length > 0) {
      isLoginButtonActive = false;
      userFieldErrorMessage = 'Email inválido';
      return;
    }
    isLoginButtonActive = true;
    userFieldErrorMessage = null;
  }

  @action
  void validatePasswordField(String password) {
    if (password.length == 0) {
      isLoginButtonActive = false;
      passwordFieldErrorMessage = null;
      return;
    } else if (password.length < 6) {
      isLoginButtonActive = false;
      passwordFieldErrorMessage = 'Senha muito curta';
      return;
    }
    isLoginButtonActive = true;
    passwordFieldErrorMessage = null;
  }

  @action
  bool confirmPassword(String password, String passwordConfirmation) => password == passwordConfirmation; 

  @action
  Future login(String user, String password) async {
    try{
      await authService.login(user, password);
    }catch(e){
      print(e);
    }

    isLoggedIn = authService.isLoggedIn;
    if (!isLoggedIn) isUserSignedUp = false;
  }

  @action
  signUp(String user, String password) async {
    try {
      await authService.signUp(user, password);
      isLoggedIn = authService.isLoggedIn;
    } catch (e) {
      print(e);
      print('erro no cadastro');
    }
  }

  @action
  void revertPasswordObscurityState() {
    isPasswordObscured = !isPasswordObscured;
  }

  @action
  void fetchLoginStatus() {
    isLoggedIn = authService.isLoggedIn;
  }
}
