import 'package:get_it/get_it.dart';
import 'package:learning_project/src/services/auth_service/auth_service.dart';
import 'package:mobx/mobx.dart';

import '../models/film.dart';
import '../services/ghibli_service/ghibli_service.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store { 

  var authService = GetIt.I.get<AuthService>();
  var ghibliService = GetIt.I.get<GhibliService>();
  int _numberItemsToFetch = 5;

  @observable
  bool isFetchingFilmes = false;

  @observable
  bool isLoggedIn = true;

  @observable
  List<dynamic> films = <Film>[];
  
  @action 
  Future fetchFilms() async{
    isFetchingFilmes = true;
    print(_numberItemsToFetch);
    films = (await ghibliService.fetchFilms(_numberItemsToFetch)).body.map((e)=>Film.fromJson(e)).toList();
    isFetchingFilmes = false;
    _numberItemsToFetch+=5;
  }

  @action 
  void logout()async{
    await authService.logout();
    isLoggedIn = authService.isLoggedIn;
  }

  @action
  void checkLogin() => isLoggedIn = authService.isLoggedIn;

}