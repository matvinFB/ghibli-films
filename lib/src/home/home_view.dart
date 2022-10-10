import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_project/src/home/widgets/filmListViewItem.dart';
import 'package:learning_project/src/home/home_controller.dart';
import 'package:mobx/mobx.dart';

import '../config/themes/theme_controller.dart';

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
  late ReactionDisposer autorunDisposable;

  @override
  void initState() {
    super.initState();
    homeController.checkLogin();
    if (!homeController.isLoggedIn) Navigator.of(context).pop();
    homeController.fetchFilms();
    currentTheme = themeController.currentTheme;

    scrollController.addListener(() {
      if (scrollController.position.pixels >
              scrollController.position.maxScrollExtent - 50 &&
          !homeController.isFetchingFilmes) {
        homeController.fetchFilms();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    autorunDisposable = autorun(
      (_) {
        if (!homeController.isLoggedIn) {
          Navigator.of(context).pop();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return Stack(
            children: [
              AppBar(
                  centerTitle: true,
                  title:
                      Text('Ghibli', style: currentTheme.textTheme.titleLarge),
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
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      gradient: RadialGradient(
                          radius: 0.1,
                          tileMode: TileMode.mirror,
                          colors: [
                            currentTheme.primaryColor.withAlpha(240),
                            Colors.amber.shade700.withAlpha(240)
                          ]),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(80)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, -5),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 40, right: 40),
                    child: Stack(
                      children: [
                        ListView.builder(
                          controller: scrollController,
                          itemCount: homeController.films.length,
                          itemBuilder: (context, index) {
                            var film = homeController.films[index];
                            return FilmListViewItem(film, index);
                          },
                          padding: const EdgeInsets.only(top: 15),
                        ),
                        homeController.isFetchingFilmes
                            ? Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: const BoxDecoration(
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
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    autorunDisposable();
    super.dispose();
  }
}
