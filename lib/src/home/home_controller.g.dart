// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$isFetchingFilmesAtom =
      Atom(name: '_HomeControllerBase.isFetchingFilmes', context: context);

  @override
  bool get isFetchingFilmes {
    _$isFetchingFilmesAtom.reportRead();
    return super.isFetchingFilmes;
  }

  @override
  set isFetchingFilmes(bool value) {
    _$isFetchingFilmesAtom.reportWrite(value, super.isFetchingFilmes, () {
      super.isFetchingFilmes = value;
    });
  }

  late final _$isLoggedInAtom =
      Atom(name: '_HomeControllerBase.isLoggedIn', context: context);

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

  late final _$filmsAtom =
      Atom(name: '_HomeControllerBase.films', context: context);

  @override
  List<dynamic> get films {
    _$filmsAtom.reportRead();
    return super.films;
  }

  @override
  set films(List<dynamic> value) {
    _$filmsAtom.reportWrite(value, super.films, () {
      super.films = value;
    });
  }

  late final _$fetchFilmsAsyncAction =
      AsyncAction('_HomeControllerBase.fetchFilms', context: context);

  @override
  Future<dynamic> fetchFilms() {
    return _$fetchFilmsAsyncAction.run(() => super.fetchFilms());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void logout() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.logout');
    try {
      return super.logout();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkLogin() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.checkLogin');
    try {
      return super.checkLogin();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFetchingFilmes: ${isFetchingFilmes},
isLoggedIn: ${isLoggedIn},
films: ${films}
    ''';
  }
}
