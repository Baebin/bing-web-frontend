import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_images.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Container(
          width: size.isMobile ? size.width * 0.9 : 450,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: BingColors.primary.withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildProfileImage(size),
              const SizedBox(height: 24),

              Text(
                "빙구 (Binggu)",
                style: size.isMobile ? BingTextStyles.headerLogoSmall : BingTextStyles.headerLogo,
              ),
              const SizedBox(height: 8),
              Text(
                "빙구의 빈 공간 - 개발과 일상을 기록합니다.",
                textAlign: TextAlign.center,
                style: size.isMobile ? BingTextStyles.dialogBodySmall : BingTextStyles.dialogBody,
              ),
              const SizedBox(height: 32),

              _buildStatRow(),
              const SizedBox(height: 32),

              _buildActionButton(
                label: "프로필 수정",
                icon: Icons.edit_outlined,
                onPressed: () {
                  context.showAlert(title: "프로필", content: "우에엥");
                },
              ),
              const SizedBox(height: 12),

              _buildActionButton(
                label: "로그아웃",
                icon: Icons.logout_rounded,
                isSecondary: true,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(Size size) {
    return Stack(
      children: [
        CachedImage(
          url: BingImages.logo.path, // 프로필 사진 경로
          width: size.isMobile ? 120 : 150,
          isCircle: true,
          hasSolidBorder: true,
          borderWidth: 4,
          borderColor: BingColors.primary.withValues(alpha: 0.5),
        ),
        // 상태 표시창
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem("포스트", "24"),
        _buildVerticalDivider(),
        _buildStatItem("방명록", "128"),
        _buildVerticalDivider(),
        _buildStatItem("빙구단", "1.2k"),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: BingColors.primaryDark)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 13, color: Colors.grey)),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(height: 20, width: 1, color: Colors.grey.withValues(alpha: 0.3));
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    bool isSecondary = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: isSecondary ? Colors.grey : BingColors.primary,
          side: BorderSide(color: isSecondary ? Colors.grey.withValues(alpha: 0.3) : BingColors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),
    );
  }
}