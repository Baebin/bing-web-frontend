import 'package:bing_web_frontend/features/auth/presentation/page/login_page.dart';
import 'package:bing_web_frontend/features/auth/presentation/page/profile_page.dart';
import 'package:bing_web_frontend/features/auth/presentation/page/sign_up_page.dart';
import 'package:bing_web_frontend/features/home/presentation/page/home_page.dart';
import 'package:flutter/material.dart';

class BingRoute {
  static const home = "/";
  static const login = "/login";
  static const signUp = "/signup";
  static const profile = "/profile";

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    signUp: (context) => const SignupPage(),
    profile: (context) => const ProfilePage(),
  };
}