import 'package:mysql1/mysql1.dart';
import 'package:http/http.dart' as http;

class MySqlCon {
  static String _host = "192.168.100.1",
      _user = "root",
      _password = 'SpassDate34#bus?', 
      _db = 'cashflow';
  static int _port = 3306;

  // static var dbconn;

  MySqlCon();

  Future<MySqlConnection> getconnection() async {
    var setting =ConnectionSettings(
      host:  _host,
      // host: _host,
      port: _port,
      user: _user,
      password: _password,
      db: _db,
    );

    return await MySqlConnection.connect(setting);
  }

  // Future<Null> getconnection() async {
  //   var setting = ConnectionSettings(
  //     host: _host,
  //     port: _port,
  //     user: _user,
  //     password: _password,
  //     db: _db,
  //   );

  //   dbconn= MySqlConnection.connect(setting);
  // }
}
