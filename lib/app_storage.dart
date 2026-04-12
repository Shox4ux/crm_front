import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String tokenKey = "token";
const String userIdKey = "user_id";
const String localeKey = "locale";

class AppStorage {
  Future<void> decodeAndSaveTokenInfo(String token) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> payload = Jwt.parseJwt(token);

    await prefs.setString(tokenKey, token);
    await prefs.setInt(userIdKey, payload['user_id']);
    print("Token saved: $token");
    print("User ID saved: ${payload['user_id']}");
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userIdKey);
  }

  Future<bool> isExpired() async {
    final token = await getToken();
    if (token == null) return true;
    return Jwt.isExpired(token);
  }

  Future<void> setLanguageCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(localeKey, code);
  }

  Future<String?> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(localeKey);
  }
}
