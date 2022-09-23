import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  bool isLoggedIn = false;

  void login(String user, String password);
  void logout();
}

class AuthService implements IAuthService {
  @override
  bool isLoggedIn;

  User? user;
  var _auth = FirebaseAuth.instance;

  late UserCredential credential;

  AuthService(this.isLoggedIn) {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((event) {
      user = (event == null) ? null : event;
    });
  }

  @override
  Future login(String user, String password) async {
    print('LOGIN SEM FIREBASE!!!!');
    isLoggedIn= true;
    return;
    try {
      credential = await _auth.signInWithEmailAndPassword(
          email: user, password: password);
      isLoggedIn = true;
    } catch (e) {
      print(e);
      isLoggedIn = false;
    }
  }

  Future signUp(String user, String password) async{
    credential = await _auth.createUserWithEmailAndPassword(
          email: user, password: password);
  }

  @override
  void logout() {
    isLoggedIn = false;
  }
}
