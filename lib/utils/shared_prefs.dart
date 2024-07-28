import 'package:shared_preferences/shared_preferences.dart';

class PrefsConstants {
  static const likedProducts = "likedProducts";
}

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  Future<void> clearSharedPrefs() async {
    await _sharedPrefs.clear();
  }
}
