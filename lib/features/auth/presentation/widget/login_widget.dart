import 'package:bing_web_frontend/core/constants/app_colors.dart';
import 'package:bing_web_frontend/core/constants/app_images.dart';
import 'package:bing_web_frontend/core/constants/app_text_styles.dart';
import 'package:bing_web_frontend/core/router/app_route.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:bing_web_frontend/features/auth/presentation/widget/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Container(
          width: size.isMobile ? size.width * 0.9 : 400,
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
                width: size.isMobile ? 120 : 150,
                isCircle: true,
                hasSolidBorder: true,
                borderColor: AppColors.primary,
                borderWidth: size.isMobile ? 3.0 : 4.0,
              ),
              const SizedBox(height: 20),

              LoginTextField(label: "아이디", prefixIcon: Icons.alternate_email),
              const SizedBox(height: 16),

              LoginTextField(
                label: "비밀번호",
                prefixIcon: Icons.lock_outline,
                isPasswordField: true,
              ),
              const SizedBox(height: 30),

              _buildLoginButton(size),
              const SizedBox(height: 16),

              _buildFindAccountRow(),
              const SizedBox(height: 20),

              LineDivider(
                  isVertical: false,
                  width: double.infinity,
                  height: 1.5,
                  color: Colors.grey.withValues(alpha: 0.4)
              ),
              const SizedBox(height: 20),

              _buildSignUpRedirect(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(final Size size) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pastelBlueSoft,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: Text("로그인", style: size.isMobile ? AppTextStyles.buttonLabelSmall : AppTextStyles.buttonLabel),
      ),
    );
  }

  Widget _buildFindAccountRow() {
    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TextButton(onPressed: () {}, child: const Text("아이디 찾기")),
        LineDivider(isVertical: true, width: 1.0, height: 12.0, color: Colors.grey),
        TextButton(onPressed: () {}, child: const Text("비밀번호 찾기")),
      ],
    );
  }

  Widget _buildSignUpRedirect(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text("아직 계정이 없으신가요?", style: TextStyle(color: Colors.grey)),
        TextButton(
          onPressed: () => context.push(AppRoute.signUp),
          child: const Text(
            "회원가입",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}