import 'package:mobile_banking/model/list_users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListSharedPreference {
  static SharedPreferences? prefs;

  static Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static setId(int $id) {
    prefs!.setInt('id', $id);
  }

  static getId() {
    return prefs!.getInt('id');
  }

  static setUsername(String $username) {
    prefs!.setString('username', $username);
  }

  static getUsername() {
    return prefs!.getString('username');
  }

  static setNama(String $nama) {
    prefs!.setString('nama', $nama);
  }

  static getNama() {
    return prefs!.getString('nama');
  }

  static setSaldo(double $saldo) {
    prefs!.setDouble('saldo', $saldo);
  }

  static getSaldo() {
    return prefs!.getDouble('saldo');
  }
}
