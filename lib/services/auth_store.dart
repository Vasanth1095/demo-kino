import 'package:shared_preferences/shared_preferences.dart';

class SavedUser {
  const SavedUser({
    required this.name,
    required this.phone,
    required this.password,
  });

  final String name;
  final String phone;
  final String password;
}

class AuthStore {
  static const _nameKey = 'registered_user_name';
  static const _phoneKey = 'registered_user_phone';
  static const _passwordKey = 'registered_user_password';

  Future<void> registerUser({
    required String name,
    required String phone,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name.trim());
    await prefs.setString(_phoneKey, phone.trim());
    await prefs.setString(_passwordKey, password);
  }

  Future<SavedUser?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_nameKey);
    final phone = prefs.getString(_phoneKey);
    final password = prefs.getString(_passwordKey);

    if (name == null || phone == null || password == null) {
      return null;
    }

    return SavedUser(name: name, phone: phone, password: password);
  }

  Future<bool> canLogin({
    required String phone,
    required String password,
  }) async {
    final user = await loadUser();
    if (user == null) return false;

    return user.phone == phone.trim() && user.password == password;
  }
}
