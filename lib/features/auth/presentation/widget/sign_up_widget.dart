import 'package:bing_web_frontend/core/constants/app_colors.dart';
import 'package:bing_web_frontend/core/constants/app_images.dart';
import 'package:bing_web_frontend/core/constants/app_text_styles.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/features/auth/presentation/widget/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Container(
          width: isMobile ? size.width * 0.9 : 450,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.3),
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
              CachedImage(
                url: AppImages.logo.path,
                width: isMobile ? 100 : 130,
                isCircle: true,
                hasSolidBorder: true,
                borderColor: AppColors.primary,
                borderWidth: isMobile ? 2.5 : 3.5,
              ),
              const SizedBox(height: 24),

              Text("빙구단 신청서", style: isMobile ? AppTextStyles.headerLogoSmall : AppTextStyles.headerLogo),
              const SizedBox(height: 30),

              const LoginTextField(
                label: "아이디",
                prefixIcon: Icons.alternate_email,
              ),
              const SizedBox(height: 16),

              const LoginTextField(
                label: "이메일",
                prefixIcon: Icons.mail_outline,
              ),
              const SizedBox(height: 16),

              const LoginTextField(
                label: "비밀번호",
                prefixIcon: Icons.lock_outline,
                isPasswordField: true,
              ),
              const SizedBox(height: 16),

              const LoginTextField(
                label: "비밀번호 확인",
                prefixIcon: Icons.lock_reset,
                isPasswordField: true,
              ),
              const SizedBox(height: 30),

              _buildSignUpButton(isMobile),
              const SizedBox(height: 20),

              Wrap(
                runSpacing: 10,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text("이미 계정이 있으신가요?"),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text("로그인", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(bool isMobile) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pastelBlueSoft,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
        ),
        child: Text("회원가입", style: isMobile ? AppTextStyles.buttonLabelSmall : AppTextStyles.buttonLabel),
      ),
    );
  }
}