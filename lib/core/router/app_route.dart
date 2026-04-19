import 'package:bing_web_frontend/features/home/presentation/page/home_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const home = "/";

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
  };
}