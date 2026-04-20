import 'package:bing_web_frontend/core/constants/app_colors.dart';
import 'package:bing_web_frontend/features/home/presentation/widget/wave_widget.dart';
import 'package:flutter/material.dart';

class WaveSection extends StatelessWidget {
  const WaveSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryLight,
                AppColors.primary,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: WaveWidget(),
        ),

        const Positioned.fill(
          child: Center(
            child: Text(
              "Welcome to BingGu Blog 🌴",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}