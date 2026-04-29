import 'package:bing_web_frontend/features/account/presentation/widget/profile_widget.dart';
import 'package:bing_web_frontend/features/home/presentation/widget/home_animation_section.dart';
import 'package:bing_web_frontend/features/home/presentation/widget/home_header.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeHeader(),
        body: const Stack(
          children: [
            Positioned.fill(
              child: HomeAnimationSection(),
            ),
            ProfileWidget(),
          ],
        )
    );
  }
}