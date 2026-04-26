import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/router/bing_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() async {
  // Edit URL
  GoRouter.optionURLReflectsImperativeAPIs = true;
  // Remove # from URL
  // usePathUrlStrategy();

  await dotenv.load(fileName: "assets/config/bing.env");

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: BingRouter.router,
      debugShowCheckedModeBanner: false,

      title: "빙구의 공간",
      theme: ThemeData(
        scaffoldBackgroundColor: BingColors.background,
      ),
    );
  }
}
