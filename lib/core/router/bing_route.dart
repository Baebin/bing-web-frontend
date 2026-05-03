import 'package:bing_web_frontend/features/account/presentation/page/profile_page.dart';
import 'package:bing_web_frontend/features/auth/presentation/page/login_page.dart';
import 'package:bing_web_frontend/features/auth/presentation/page/sign_up_page.dart';
import 'package:bing_web_frontend/features/community/presentation/page/community_page.dart';
import 'package:bing_web_frontend/features/community/presentation/page/community_post_detail_page.dart';
import 'package:bing_web_frontend/features/community/presentation/page/community_post_page.dart';
import 'package:bing_web_frontend/features/home/presentation/page/home_page.dart';
import 'package:flutter/material.dart';

class BingRoute {
  static const home = "/";

  static const login = "/login";
  static const signUp = "/signup";
  static const profile = "/profile";

  static const community = "/community";
  static const communityPost = "/community/post";
  static const communityPostDetail = "/community/post/detail";

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),

    login: (context) => const LoginPage(),
    signUp: (context) => const SignupPage(),
    profile: (context) => const ProfilePage(),

    community: (context) => const CommunityPage(),
    communityPost: (context) => const CommunityPostPage(),
    communityPostDetail: (context) => const CommunityPostDetailPage(),
  };
}