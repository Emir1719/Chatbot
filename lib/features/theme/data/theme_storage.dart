import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  final SharedPreferences prefs;
  final String _themeModeKey = "themeModeKey";

  ThemeStorage(this.prefs);

  Future<void> setThemeMode(bool isDark) async {
    try {
      await prefs.setBool(_themeModeKey, isDark);
    } catch (e) {
      rethrow;
    }
  }

  bool getThemeMode() {
    try {
      return prefs.getBool(_themeModeKey) ?? true;
    } catch (e) {
      rethrow;
    }
  }
}
