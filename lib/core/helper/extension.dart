import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> push(
    Widget route, {
    Object? arguments,
  }) {
    return Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(arguments: arguments),
      ),
    );
  }

  void pop() => Navigator.of(this).pop();
}
