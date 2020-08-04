import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage({@required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  Future<Map<String, dynamic>> get(String key) async {
    if (!_sharedPreferences.containsKey(key)) {
      return null;
    }

    final list = _sharedPreferences.getStringList(key);

    return <String, dynamic>{
      'data': list.map<Map<String, dynamic>>((e) => jsonDecode(e)).toList()
    };
  }

  Future<bool> post({
    @required Map<String, dynamic> json,
    @required String key,
  }) async {
    if (!_sharedPreferences.containsKey(key)) {
      return null;
    }

    final list = _sharedPreferences.getStringList(key);
    list.add(jsonEncode(json));
    return await _sharedPreferences.setStringList(key, list);
  }

  Future<bool> update({
    @required Map<String, dynamic> json,
    @required String key,
    @required String id,
  }) async {
    if (!_sharedPreferences.containsKey(key)) {
      return null;
    }

    List<String> list = _sharedPreferences.getStringList(key);

    final jsonList =
        list.map<Map<String, dynamic>>((e) => jsonDecode(e)).toList();
    for (var i = 0; i < jsonList.length; i++) {
      final item = jsonList[i];
      if (item['id'] == json['id']) {
        list[i] = jsonEncode(json);
        return _sharedPreferences.setStringList(key, list);
      }
    }
    return false;
  }
}
