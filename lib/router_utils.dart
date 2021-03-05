import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//渐变透明路由动画
class FadeRouter<T> extends PageRouteBuilder<T> {
  final RoutePageBuilder builder;
  final int durationMs;
  final Curve curve;
  FadeRouter(
      {this.builder, this.durationMs = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            pageBuilder: builder,
            transitionDuration: Duration(milliseconds: durationMs),
            transitionsBuilder: (context, a1, a2, child) => FadeTransition(
                  opacity: Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
                    parent: a1,
                    curve: curve,
                  )),
                  child: child,
                ));
}