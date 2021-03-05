import 'package:flutter/material.dart';
import 'package:mzlx/view/page/home/home.dart';
import 'package:mzlx/router_utils.dart';

final Map<String, WidgetBuilder> _routes = {
  "/home":(context) => Home()
};

class NavigatorManager extends NavigatorObserver {
  static Map routerConfig = _routes;
  static NavigatorManager get instance => _getInstance();

  static NavigatorManager navigatorManager;

  static NavigatorManager _getInstance() {
    if (navigatorManager == null) {
      return navigatorManager = new NavigatorManager._init();
    }
    return navigatorManager;
  }
  NavigatorManager._init();
  pushNamed(String routeName, [WidgetBuilder builder]) {
    print(navigator);
  }
  
}








