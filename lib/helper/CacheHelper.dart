import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  static Future<bool?> setValue({
    @required String? kay,
    @required dynamic value,
  }) async {
    if (value is String)
      return await sharedPreferences!.setString(kay!, value);
    else if (value is int)
      return await sharedPreferences!.setInt(kay!, value);
    else if (value is bool)
      return await sharedPreferences!.setBool(kay!, value);
    else if (value is double)
      return await sharedPreferences!.setDouble(kay!, value);
    else if (value is List<String>)
      return await sharedPreferences!.setStringList(kay!, value);
  }

  static dynamic getValue({
    @required String? kay,
  }) =>
      sharedPreferences!.get(kay!);

  static Future<bool>? deleteOneValue({
    @required String? kay,
  }) async =>
      await sharedPreferences!.remove(kay!);

  static Future<bool>? deleteAllValues() async => await sharedPreferences!.clear();
}
