import 'package:shared_preferences/shared_preferences.dart';

class SessionLatihanManager{
  int? value;
  String? idUser, userName, Nama, email;

  // Simpan session
  Future<void> saveSession(int val, String id, String username, String nama, String email) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("value", val);
    sharedPreferences.setString("id", id);
    sharedPreferences.setString("username", username);
    sharedPreferences.setString("nama", nama);
    sharedPreferences.setString("email", email);
  }

  //Get session
  Future getSession() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    value = sharedPreferences.getInt("value");
    idUser = sharedPreferences.getString("id");
    userName = sharedPreferences.getString("username");
    Nama = sharedPreferences.getString("nama");
    email = sharedPreferences.getString("email");
    return value;
  }

  //Clear session --> untuk logout
  Future clearSession() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
SessionLatihanManager session = SessionLatihanManager();