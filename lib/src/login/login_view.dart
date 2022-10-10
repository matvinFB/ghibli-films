import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_project/src/config/themes/theme_controller.dart';
import 'package:learning_project/src/home/home_view.dart';
import 'package:mobx/mobx.dart';

import 'login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var loginController = LoginController();
  var themeManager = GetIt.I.get<ThemeController>();
  late ThemeData currentTheme;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginController.fetchLoginStatus();
    currentTheme = themeManager.currentTheme;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    autorun(
      (_) {
        if (loginController.isLoggedIn) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomeView(),
          ));
        } else if (!loginController.isUserSignedUp) {
          TextEditingController passwordCOnfirmationController =
              TextEditingController();
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: const Text('Deseja se cadastrar?'),
                    backgroundColor: currentTheme.primaryColor,
                    content: Observer(builder: (context) {
                      return Wrap(
                        children: [
                          SizedBox(
                            height: 25,
                            child: Text('Confirme sua senha!',
                                style: currentTheme.textTheme.titleMedium),
                          ),
                          TextField(
                            controller: passwordCOnfirmationController,
                            obscureText: loginController.isPasswordObscured,
                            style: currentTheme.textTheme.labelSmall,
                            onChanged: (value) {
                              loginController.validatePasswordField(value);
                              if (loginController.isLoginButtonActive &&
                                  loginController.confirmPassword(
                                      passwordController.text, value)) {
                                loginController.signUp(userController.text,
                                    passwordController.text);
                              }
                            },
                            decoration: InputDecoration(
                                errorText:
                                    loginController.passwordFieldErrorMessage,
                                suffixIcon: IconButton(
                                  icon: Icon(loginController.isPasswordObscured
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    loginController
                                        .revertPasswordObscurityState();
                                  },
                                )),
                          ),
                        ],
                      );
                    }),
                  )));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 370,
        width: 370,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: currentTheme.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(175)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Login',
                    style: currentTheme.textTheme.titleLarge,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Observer(builder: (context) {
                return Expanded(
                  child: SizedBox(
                    child: TextField(
                      controller: userController,
                      style: currentTheme.textTheme.labelSmall,
                      decoration: InputDecoration(
                          errorText: loginController.userFieldErrorMessage),
                      onChanged: (value) =>
                          loginController.validateUserField(value),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 10),
              Observer(builder: (context) {
                return Expanded(
                  child: TextField(
                    controller: passwordController,
                    obscureText: loginController.isPasswordObscured,
                    style: currentTheme.textTheme.labelSmall,
                    onChanged: (value) =>
                        loginController.validatePasswordField(value),
                    decoration: InputDecoration(
                        errorText: loginController.passwordFieldErrorMessage,
                        suffixIcon: IconButton(
                          icon: Icon(loginController.isPasswordObscured
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            loginController.revertPasswordObscurityState();
                          },
                        )),
                  ),
                );
              }),
              Observer(builder: (context) {
                return Expanded(
                  child: IconButton(
                      onPressed: () {
                        if (!loginController.isLoginButtonActive) return;
                        loginController.login(
                            userController.text, passwordController.text);
                      },
                      icon: Container(
                        width: 50,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 3.0,
                                  offset: const Offset(2.5, 2.5))
                            ]),
                        child: Icon(Icons.check,
                            color: !loginController.isLoginButtonActive
                                ? Colors.grey
                                : Colors.amber.shade900),
                      )),
                );
              })
            ],
          ),
        ),
      ),
    ));
  }
}
