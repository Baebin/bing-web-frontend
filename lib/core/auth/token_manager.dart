import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

var logger = Logger(printer: PrettyPrinter());

class TokenManager {
  static const String _accessTokenKey = "access_key";

  static final TokenManager _instance = TokenManager._internal();
  factory TokenManager() => _instance;
  TokenManager._internal();

  Future<void> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_accessTokenKey, token);
      logger.i("토큰 저장 완료");
    } catch (e) {
      logger.e("토큰 저장 실패: $e");
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }


  Future<bool> hasToken() async {
    String? token = await getToken();
    return token?.isNotEmpty ?? false;
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    logger.i("토큰 삭제 완료");
  }
}