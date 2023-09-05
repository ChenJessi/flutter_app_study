
import 'package:shared_preferences/shared_preferences.dart';


/**
 * 本地存储
 */
class LocalStorage{

  static save(String key,value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  static remove(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  static clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}