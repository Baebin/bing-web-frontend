import 'package:bing_web_frontend/core/auth/auth_provider.dart';
import 'package:bing_web_frontend/core/auth/token_manager.dart';
import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_images.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/dto/response/api_error_response.dart';
import 'package:bing_web_frontend/core/router/bing_route.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/widgets/hover_button.dart';
import 'package:bing_web_frontend/features/account/dto/request/bio_update_request.dart';
import 'package:bing_web_frontend/features/account/dto/request/nickname_update_request.dart';
import 'package:bing_web_frontend/features/account/service/account_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileWidget extends ConsumerStatefulWidget {
  const ProfileWidget({super.key});

  @override
  ConsumerState<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends ConsumerState<ProfileWidget> {
  static const alertName = "빙구단 프로필";

  void _handleLogout() async {
    final tokenManager = ref.read(tokenManagerProvider);
    await tokenManager.deleteToken();
    ref.invalidate(isBingJoinedProvider);

    if (!mounted) return;
    context.showAlert(
      title: alertName,
      content: "로그아웃되었습니다. 다음에 또 만나요! 👋",
      onConfirm: () => context.pushSafe(BingRoute.home),
    );
  }

  Future<dynamic> _updateNickname(String nickname) async {
    final accountService = ref.read(accountServiceProvider);
    final result = await accountService.updateNickname(
        NicknameUpdateRequest(nickname: nickname)
    );
    if (result is bool && result == true) {
      ref.invalidate(userProfileProvider);
      return true;
    }
    else if (result is ApiErrorResponse) {
      return result.message;
    }
  }

  Future<dynamic> _updateBio(String bio) async {
    final accountService = ref.read(accountServiceProvider);
    final result = await accountService.updateBio(
        BioUpdateRequest(bio: bio)
    );
    if (result is bool && result == true) {
      ref.invalidate(userProfileProvider);
      return true;
    }
    else if (result is ApiErrorResponse) {
      return result.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final userProfile = ref.watch(userProfileProvider).value;

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

              HoverButton(
                title: userProfile == null ? "빙구 (Binggu)" : userProfile.nickname,
                style: size.isMobile ? BingTextStyles.profileNicknameSmall : BingTextStyles.profileNickname,
                onTap: () => context.showInputDialog(
                    title: alertName,
                    content: "빙구단에서 불릴 새 이름을 알려주세요!",
                    initialValue: userProfile?.nickname ?? "빙구",
                    hintText: "닉네임을 입력해주세요.",
                    minLength: 2,
                    maxLength: 10,
                    onConfirm: _updateNickname,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_month_outlined, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    "가입일: ${userProfile?.regDate ?? "2004.05.05"}",
                    style: size.isMobile ? BingTextStyles.profileJoinedDateSmall : BingTextStyles.profileJoinedDate,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              HoverButton(
                title: userProfile?.bio ?? "빙구의 빈 공간 - 개발과 일상을 기록합니다.",
                style: size.isMobile ? BingTextStyles.profileBodySmall : BingTextStyles.profileBody,
                onTap: () => context.showInputDialog(
                  title: alertName,
                  content: "빙구단원들에게 들려줄 짧은 인사를 남겨보세요!",
                  initialValue: userProfile?.bio ?? "빙구단원",
                  hintText: "프로필 소개를 입력해주세요.",
                  minLength: 1,
                  maxLength: 150,
                  onConfirm: _updateBio,
                ),
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
                onPressed: _handleLogout,
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
          url: BingImages.logo.path,
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