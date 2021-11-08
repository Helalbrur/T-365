
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences=_preferences;

  static const _name = 'username';
  static const _id = 'id';
  static const _role = 'birthday';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setName(String username) async =>
      await _preferences.setString(_name, username);

  static String getName() => _preferences.getString(_name) ?? '';

  static Future setId(String id) async =>
      await _preferences.setString(_id, id);

  static String getId() => _preferences.getString(_id) ?? '';

  static Future setRole(String role) async {
    return await _preferences.setString(_role, role);
  }

  static String getRole() {
    return _preferences.getString(_role) ?? '';
  }
}