// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NavigationModel {
  final Widget page;
  final GlobalKey<NavigatorState> navigatorKey;
  
  NavigationModel({
    required this.page,
    required this.navigatorKey,
  });
}
