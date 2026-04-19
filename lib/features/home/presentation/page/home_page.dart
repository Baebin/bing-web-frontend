import 'package:bing_web_frontend/features/home/presentation/widget/home_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      body: Center(
        child: Column(
          children: [

          ],
        )
      ),
    );
  }
}