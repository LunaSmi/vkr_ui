import 'package:flutter/material.dart';
import 'package:vkr_ui/ui/roots/auth.dart';
import 'package:vkr_ui/ui/roots/home.dart';
import 'package:vkr_ui/ui/roots/loader.dart';

class NavigationRoutes {
  static const loaderWidget = "/";
  static const auth = "/auth";
  static const home = "/home";
}

class AppNavigator {
  static final key = GlobalKey<NavigatorState>();

  static void toLoader() {
       key.currentState?.pushNamed(NavigationRoutes.loaderWidget);
    }

    static void toAuth() {
    key.currentState
        ?.pushNamedAndRemoveUntil(NavigationRoutes.auth, ((route) => false));
  }

  static void toHome() {
    key.currentState
        ?.pushNamedAndRemoveUntil(NavigationRoutes.home, ((route) => false));
  }  

  static Route<dynamic>? onGeneratedRoutes(RouteSettings settings, context) {
    switch (settings.name) {
      case NavigationRoutes.loaderWidget:
        return PageRouteBuilder(pageBuilder: ((_, __, ___) => LoaderWidget()));
      case NavigationRoutes.auth:
        return PageRouteBuilder(pageBuilder: ((_, __, ___) => Auth.create()));
      case NavigationRoutes.home:
        return PageRouteBuilder(
            pageBuilder: ((_, __, ___) => const Home(
                  title: "Hi",
                )));
    }
    return null;
  }
}