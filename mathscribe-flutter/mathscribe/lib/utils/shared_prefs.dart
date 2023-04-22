// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  int get id => _sharedPrefs.getInt(Keys.key_id) ?? -1;
  set id(int value) {
    _sharedPrefs.setInt(Keys.key_id, value);
  }

  bool get is_first_open => _sharedPrefs.getBool(Keys.key_isfirstopen) ?? true;
  set is_first_open(bool value) {
    _sharedPrefs.setBool(Keys.key_isfirstopen, value);
  }
}
