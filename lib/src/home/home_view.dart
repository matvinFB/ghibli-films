import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_project/src/home/widgets/filmListViewItem.dart';
import 'package:learning_project/src/home/home_controller.dart';
import 'package:learning_project/src/models/film.dart';
import 'package:mobx/mobx.dart';

import '../config/themes/theme_controller.dart';
import '../services/ghibli_service/ghibli_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var homeController = HomeController();
  var scrollController = ScrollController();
  var themeController = GetIt.I.get<ThemeController>();
  late ThemeData currentTheme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.checkLogin();
    if (!homeController.isLoggedIn) Navigator.of(context).pop();
    homeController.fetchFilms();
    currentTheme = themeController.currentTheme;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    autorun(
      (_) {
        if (!homeController.isLoggedIn) {
          Navigator.of(context).pop();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    scrollController
      ..addListener(() {
        if (scrollController.position.pixels >
                scrollController.position.maxScrollExtent - 50 &&
            !homeController.isFetchingFilmes) {
          homeController.fetchFilms();
        }
      });

    return Scaffold(body: Observer(
      builder: (context) {
        return Stack(
          children: [
            AppBar(
                centerTitle: true,
                title: Text('Ghibli', style: currentTheme.textTheme.titleLarge),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                      onPressed: () {
                        homeController.logout();
                      },
                      icon: const Icon(
                        Icons.logout,
                      ))
                ]),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(80)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, -5),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
                  child: Stack(
                    children: [
                      ListView.builder(
                        controller: scrollController,
                        itemCount: homeController.films.length,
                        itemBuilder: (context, index) {
                          var film = homeController.films[index];
                          return FilmListViewItem(film, index);
                        },
                        padding: EdgeInsets.only(top: 15),
                      ),
                      homeController.isFetchingFilmes
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 35,
                                width: 35,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                ),
                                child: CircularProgressIndicator(
                                  color: currentTheme.primaryColor,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}
