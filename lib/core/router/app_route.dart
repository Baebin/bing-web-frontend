import 'package:bing_web_frontend/features/auth/presentation/page/login_page.dart';
import 'package:bing_web_frontend/features/home/presentation/page/home_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const home = "/";
  static const login = "/login";

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
  };
}