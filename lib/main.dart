import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/router/bing_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
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

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

        FlutterQuillLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
        Locale('en', 'US'),
      ],
      title: "빙구의 공간",
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: BingColors.background,
      ),
    );
  }
}