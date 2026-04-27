import 'package:bing_web_frontend/core/auth/auth_provider.dart';
import 'package:bing_web_frontend/core/auth/token_manager.dart';
import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_images.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/dto/response/api_error_response.dart';
import 'package:bing_web_frontend/core/dto/response/token_response.dart';
import 'package:bing_web_frontend/core/router/bing_route.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:bing_web_frontend/features/auth/dto/request/login_request.dart';
import 'package:bing_web_frontend/features/auth/presentation/widget/auth_text_field.dart';
import 'package:bing_web_frontend/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginWidget extends ConsumerStatefulWidget {
  const LoginWidget({super.key});

  @override
  ConsumerState<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends ConsumerState<LoginWidget> {
  static const alertName = "빙구단 입장 확인";

  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final id = _idController.text;
    final password = _passwordController.text;

    final authService = ref.read(authServiceProvider);
    final result = await authService.login(
        LoginRequest(id: id, password: password)
    );
    if (result is TokenResponse) {
      final tokenManager = TokenManager();
      await tokenManager.saveToken(result.accessToken);
      ref.invalidate(isBingJoinedProvider);

      if (!mounted) return;
      context.showAlert(
        title: alertName,
        content: "로그인에 성공했습니다! 🎉",
        onConfirm: () => context.pushSafe(BingRoute.home),
      );
      return;
    }
    else if (result is ApiErrorResponse) {
      if (!mounted) return;
      context.showAlert(
        title: alertName,
        content: "로그인 실패: ${result.message} 😥",
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

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
              color: BingColors.primary.withValues(alpha: 0.3),
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
                url: BingImages.logo.path,
                width: size.isMobile ? 120 : 150,
                isCircle: true,
                hasSolidBorder: true,
                borderWidth: size.isMobile ? 3.0 : 4.0,
                borderColor: BingColors.primary,
              ),
              const SizedBox(height: 20),

              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthTextField(
                        label: "아이디",
                        prefixIcon: Icons.alternate_email,
                        controller: _idController,
                        hasValidator: true,
                      ),
                      const SizedBox(height: 16),

                      AuthTextField(
                        label: "비밀번호",
                        prefixIcon: Icons.lock_outline,
                        controller: _passwordController,
                        isPasswordField: true,
                        hasValidator: true,
                        onSubmitted: _handleLogin,
                      ),
                      const SizedBox(height: 30),

                      _buildLoginButton(size),
                    ],
                  )
              ),
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
        onPressed: _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: BingColors.pastelBlueSoft,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: Text("로그인", style: size.isMobile ? BingTextStyles.buttonLabelSmall : BingTextStyles.buttonLabel),
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
          onPressed: () => context.pushSafe(BingRoute.signUp),
          child: const Text(
            "회원가입",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: BingColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}