// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$isLoggedInAtom =
      Atom(name: '_LoginControllerBase.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$isLoginButtonActiveAtom =
      Atom(name: '_LoginControllerBase.isLoginButtonActive', context: context);

  @override
  bool get isLoginButtonActive {
    _$isLoginButtonActiveAtom.reportRead();
    return super.isLoginButtonActive;
  }

  @override
  set isLoginButtonActive(bool value) {
    _$isLoginButtonActiveAtom.reportWrite(value, super.isLoginButtonActive, () {
      super.isLoginButtonActive = value;
    });
  }

  late final _$isPasswordObscuredAtom =
      Atom(name: '_LoginControllerBase.isPasswordObscured', context: context);

  @override
  bool get isPasswordObscured {
    _$isPasswordObscuredAtom.reportRead();
    return super.isPasswordObscured;
  }

  @override
  set isPasswordObscured(bool value) {
    _$isPasswordObscuredAtom.reportWrite(value, super.isPasswordObscured, () {
      super.isPasswordObscured = value;
    });
  }

  late final _$isUserSignedUpAtom =
      Atom(name: '_LoginControllerBase.isUserSignedUp', context: context);

  @override
  bool get isUserSignedUp {
    _$isUserSignedUpAtom.reportRead();
    return super.isUserSignedUp;
  }

  @override
  set isUserSignedUp(bool value) {
    _$isUserSignedUpAtom.reportWrite(value, super.isUserSignedUp, () {
      super.isUserSignedUp = value;
    });
  }

  late final _$userFieldErrorMessageAtom = Atom(
      name: '_LoginControllerBase.userFieldErrorMessage', context: context);

  @override
  String? get userFieldErrorMessage {
    _$userFieldErrorMessageAtom.reportRead();
    return super.userFieldErrorMessage;
  }

  @override
  set userFieldErrorMessage(String? value) {
    _$userFieldErrorMessageAtom.reportWrite(value, super.userFieldErrorMessage,
        () {
      super.userFieldErrorMessage = value;
    });
  }

  late final _$passwordFieldErrorMessageAtom = Atom(
      name: '_LoginControllerBase.passwordFieldErrorMessage', context: context);

  @override
  String? get passwordFieldErrorMessage {
    _$passwordFieldErrorMessageAtom.reportRead();
    return super.passwordFieldErrorMessage;
  }

  @override
  set passwordFieldErrorMessage(String? value) {
    _$passwordFieldErrorMessageAtom
        .reportWrite(value, super.passwordFieldErrorMessage, () {
      super.passwordFieldErrorMessage = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginControllerBase.login', context: context);

  @override
  Future<dynamic> login(String user, String password) {
    return _$loginAsyncAction.run(() => super.login(user, password));
  }

  late final _$signUpAsyncAction =
      AsyncAction('_LoginControllerBase.signUp', context: context);

  @override
  Future signUp(String user, String password) {
    return _$signUpAsyncAction.run(() => super.signUp(user, password));
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

  @override
  void validateUserField(String user) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.validateUserField');
    try {
      return super.validateUserField(user);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePasswordField(String password) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.validatePasswordField');
    try {
      return super.validatePasswordField(password);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool confirmPassword(String password, String passwordConfirmation) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.confirmPassword');
    try {
      return super.confirmPassword(password, passwordConfirmation);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void revertPasswordObscurityState() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.revertPasswordObscurityState');
    try {
      return super.revertPasswordObscurityState();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchLoginStatus() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.fetchLoginStatus');
    try {
      return super.fetchLoginStatus();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoggedIn: ${isLoggedIn},
isLoginButtonActive: ${isLoginButtonActive},
isPasswordObscured: ${isPasswordObscured},
isUserSignedUp: ${isUserSignedUp},
userFieldErrorMessage: ${userFieldErrorMessage},
passwordFieldErrorMessage: ${passwordFieldErrorMessage}
    ''';
  }
}
