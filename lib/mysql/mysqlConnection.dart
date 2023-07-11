import 'package:mysql1/mysql1.dart';

class Mysql{
  static String host = "192.168.0.26",
                user = "eVoznik",
                password = "evoznik123!",
                db ="eVoznikDB";

  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection()  async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db
    );
    return await MySqlConnection.connect(settings);
  }
}