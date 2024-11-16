import 'package:mysql1/mysql1.dart';

void main() async {
  var settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'Lemeniz@pass1',
    db: 'user_profile',
  );

  var connection = await MySqlConnection.connect(settings);
  print('Connected to MySQL database!');

  var results = await connection.query('SELECT * FROM your_table');
  for (var row in results) {
    print(row.fields);
  }

  await connection.close();
}
