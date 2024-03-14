
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sreshtgeeth/view/music/musicplayer.dart';
import 'deletepage.dart';
import 'main.dart';

class RouteServices {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/homepage':
        return CupertinoPageRoute(builder: (_) {
          return const delete();
        });

      case "/MusicPlayer":
        if (args is Map) {
          return CupertinoPageRoute(builder: (_) {
            return MusicPlayer(
              id: args['id'],
              types: args['types'],
              songid: args['songid'],
              songtitle: args['songtitle'],
              indexx: args['indexx'],
              //profile: args["profile"],
            );
          });
        }
        return _errorRoute1();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute1() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Page Not Found"),
        ),
      );
    });
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return MyApp();
    });
  }
}