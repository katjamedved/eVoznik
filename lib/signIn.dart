import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key});


  Future<bool> validateLogin(String email, String password) async {
    final DB_IP = "localhost";
    final DB_PORT = 3306;
    final DB_NAME = "eVoznikDB";
    final DB_USERNAME = "eVoznik";
    final DB_PASS = "evoznik123!";

    final settings = ConnectionSettings(
      host: DB_IP,
      port: DB_PORT,
      user: DB_USERNAME,
      password: DB_PASS,
      db: DB_NAME,
      timeout: const Duration(seconds: 5),
    );

    if (email.isEmpty) {
      print("Email is empty");
      return false;
    }
    if (password.isEmpty || password.length < 6) {
      print("Invalid password");
      return false;
    }

    print("DB CONNECTION TEST");
    try {
      final conn = await MySqlConnection.connect(settings);
      print("Connected to MySQL database");

      // Execute queries or perform other database operations here

      // Execute the SELECT query
      final results = await conn.query('SELECT * FROM users');

      // Print the results
      for (var row in results) {
        print(row.fields);
      }


      await conn.close();
      print("Connection closed");
      return true;
    } catch (e) {
      print("Error connecting to MySQL database: $e");
      return false;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[200], // Set the desired background color here
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16.0),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  bool validate = await validateLogin("email", "password") ;
                  if(validate){
                    Navigator.pushNamedAndRemoveUntil(context, '/loadingScreen', (route) => false);
                  }
                  // Handle sign in
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
        resizeToAvoidBottomInset: false
    );
  }
}
