import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  void login(String user, String password);
  void logout();
  void signUp(String user, String password);
  bool checkLogin();
}

class AuthService implements IAuthService {
  bool isLoggedIn;

  User? user;
  final _auth = FirebaseAuth.instance;

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
    //print('LOGIN SEM FIREBASE!!!!');
    //isLoggedIn= true;
    //return;
    try {
      credential = await _auth.signInWithEmailAndPassword(
          email: user, password: password);
    } catch (e) {
      rethrow;
    } finally {
      isLoggedIn = checkLogin();
    }
  }

  @override
  Future signUp(String user, String password) async {
    credential = await _auth.createUserWithEmailAndPassword(
        email: user, password: password);
    isLoggedIn = checkLogin();
  }

  @override
  Future logout() async {
    await _auth.signOut();
    isLoggedIn = checkLogin();
  }

  @override
  bool checkLogin() {
    return user == null ? false : true;
  }
}
