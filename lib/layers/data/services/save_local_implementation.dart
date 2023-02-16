import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_challenge/layers/domain/services/save_local.dart';

class SaveLocalImplementation implements SaveLocal {
  final SharedPreferences sharedPreferences;

  SaveLocalImplementation(this.sharedPreferences);

  @override
  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  @override
  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  @override
  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  @override
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool?> removeKey(String key) async {
    return await sharedPreferences.remove(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> setDouble(String key, double value) async {
    await sharedPreferences.setDouble(key, value);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await sharedPreferences.setInt(key, value);
  }

  @override
  Future<void> setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }
}
