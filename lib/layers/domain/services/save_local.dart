abstract class SaveLocal {
  Future<void> setInt(String key, int value);
  Future<void> setBool(String key, bool value);
  Future<void> setDouble(String key, double value);
  Future<void> setString(String key, String value);
  int? getInt(String key);
  bool? getBool(String key);
  double? getDouble(String key);
  String? getString(String key);
  Future<bool?> removeKey(String key);
}
