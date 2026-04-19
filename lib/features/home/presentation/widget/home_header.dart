import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/constants/app_images.dart';
import 'package:bing_web_frontend/core/widgets/hover_button.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: Row(
        children: [
          SizedBox(width: 5),
          const CachedImage(url: AppImages.logo, isCircle: true),

          SizedBox(width: 10),
          const Text("빙구 블로그", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),

          const Spacer(),

          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HoverButton(
                  title: "Test",
                  fontSize: 32,
                  onTap: () => {}),
              HoverButton(
                  title: "Test",
                  fontSize: 32,
                  onTap: () => {}),
              HoverButton(
                  title: "Test",
                  fontSize: 32,
                  onTap: () => {}),
              HoverButton(
                  title: "Test",
                  fontSize: 32,
                  onTap: () => {}),
            ],
          ),
          SizedBox(width: 50),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}