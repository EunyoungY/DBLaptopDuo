// import 'package:mysql1/mysql1.dart';
//
// class Mysql {
//   static String host = 'mydbinstance.cldteedr2zuv.ap-northeast-2.rds.amazonaws.com',
//       user = 'mydb',
//       password = '12345678',
//       db = 'dbfinal';
//   static int port = 3306;
//
//   Mysql();
//
//   Future<MySqlConnection> getConnection() async {
//     var settings = new ConnectionSettings(
//         host: host,
//         port: port,
//         user: user,
//         password: password,
//         db: db
//     );
//     return await MySqlConnection.connect(settings);
//   }
// }