import 'package:bing_web_frontend/features/auth/presentation/widget/sign_up_widget.dart';
import 'package:bing_web_frontend/features/home/presentation/widget/home_animation_section.dart';
import 'package:bing_web_frontend/features/home/presentation/widget/home_header.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeHeader(),
        body: const Stack(
          children: [
            Positioned.fill(
              child: HomeAnimationSection(),
            ),
            SignUpWidget(),
          ],
        )
    );
  }
}