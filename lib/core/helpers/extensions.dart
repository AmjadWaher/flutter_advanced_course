import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtensions on String {
  String replaceFirstDot() {
    return replaceFirst(RegExp(r'.'), ' ', 2);
  }

  String capitalizeEachWord() {
    bool hasDot = contains('.');

    return split(RegExp(r'[ .]+'))
        .map((word) {
          return word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
              : '';
        })
        .join(hasDot ? '. ' : ' ');
  }

  String formatTimeTo12Hour() {
    final parsedTime = DateFormat('hh:mm:ss').parse(this);

    return DateFormat('hh:mm a').format(parsedTime);
  }
}

extension StringNullExtensions on String? {
  bool isNullOrEmpty() => this == null || this == "";
}
