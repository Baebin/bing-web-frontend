import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_images.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/dto/response/api_error_response.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/features/auth/dto/request/sign_up_request.dart';
import 'package:bing_web_frontend/features/auth/presentation/widget/auth_text_field.dart';
import 'package:bing_web_frontend/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpWidget extends ConsumerStatefulWidget {
  const SignUpWidget({super.key});

  @override
  ConsumerState<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends ConsumerState<SignUpWidget> {
  static const alertName = "빙구단 신청서";

  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _handleSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    final id = _idController.text;
    final nickname = _nicknameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final passwordConfirm = _passwordConfirmController.text;
    if (password != passwordConfirm) {
      context.showAlert(
        title: alertName,
        content: "빙구단 가입을 위해 비밀번호를\n한 번 더 똑같이 적어주세요!",
      );
      return;
    }

    final authService = ref.read(authServiceProvider);
    final result = await authService.signUp(
      SignUpRequest(id: id, nickname: nickname, email: email, password: password)
    );
    if (!mounted) return;
    if (result is bool && result == true) {
      context.showAlert(
        title: alertName,
        content: "**빙구단 합격 통지서**가 도착했습니다! 💌\n\n축하드려요! 이제 정식 단원으로서\n**당신만의 빈 공간**을 선물해 드립니다.\n지금 바로 로그인해서 그 첫 발을 내디뎌 보세요.",
        onConfirm: () => Navigator.pop(context),
      );
      return;
    }
    else if (result is ApiErrorResponse) {
      context.showAlert(
        title: alertName,
        content: "접수 실패: ${result.message} 😥",
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Container(
          width: size.isMobile ? size.width * 0.9 : 450,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: BingColors.whiteOverlay,
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
                width: size.isMobile ? 100 : 130,
                isCircle: true,
                hasSolidBorder: true,
                borderWidth: size.isMobile ? 2.5 : 3.5,
                borderColor: BingColors.primary,
              ),
              const SizedBox(height: 24),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("빙구단 신청서", style: size.isMobile ? BingTextStyles.headerLogoSmall : BingTextStyles.headerLogo),
                    const SizedBox(height: 30),

                    AuthTextField(
                      label: "아이디",
                      prefixIcon: Icons.alternate_email,
                      controller: _idController,
                      hasValidator: true,
                    ),
                    const SizedBox(height: 16),

                    AuthTextField(
                      label: "닉네임",
                      prefixIcon: Icons.badge_outlined,
                      controller: _nicknameController,
                      hasValidator: true,
                    ),
                    const SizedBox(height: 16),

                    AuthTextField(
                      label: "이메일",
                      prefixIcon: Icons.mail_outline,
                      controller: _emailController,
                      hasValidator: true,
                    ),
                    const SizedBox(height: 16),

                    AuthTextField(
                      label: "비밀번호",
                      prefixIcon: Icons.lock_outline,
                      controller: _passwordController,
                      isPasswordField: true,
                      hasValidator: true,
                    ),
                    const SizedBox(height: 16),

                    AuthTextField(
                      label: "비밀번호 확인",
                      prefixIcon: Icons.enhanced_encryption_outlined,
                      controller: _passwordConfirmController,
                      isPasswordField: true,
                      hasValidator: true,
                      onSubmitted: _handleSignUp,
                    ),
                    const SizedBox(height: 30),

                    _buildSignUpButton(size),
                  ],
                )
              ),
              const SizedBox(height: 20),

              Wrap(
                runSpacing: 10,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text("이미 계정이 있으신가요?"),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
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

  Widget _buildSignUpButton(Size size) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _handleSignUp,
        style: ElevatedButton.styleFrom(
          backgroundColor: BingColors.pastelBlueSoft,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
        ),
        child: Text("회원가입", style: size.isMobile ? BingTextStyles.buttonLabelSmall : BingTextStyles.buttonLabel),
      ),
    );
  }
}