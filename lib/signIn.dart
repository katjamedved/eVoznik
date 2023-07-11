import 'package:e_vozniska/mysql/mysqlConnection.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key});



  Future<bool> validateLogin(String email, String password) async {
    var mySql = Mysql();


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
      final conn = await mySql.getConnection();
      print("Connected to MySQL database");

      // Execute queries or perform other database operations here
      final resoults = await conn.query("SELECT password FROM signin_data WHERE email = ?", [email]);

      // Execute the SELECT query
      if(await resoults.isEmpty){
        print("RESOULTS ARE EMPTY");
      }

      else{
        if(resoults.length==1){
          for(var row in resoults){
            if (row[0] == password){
              return true;
            }
          }
        }
        else{
          print("More than 1 user with this email");
        }
      }
    } catch (e) {
      print("Error connecting to MySQL database: $e");
      return false;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    String userEmail ="";
    String userPass = "";

    return Scaffold(
      body: Container(
        color: Colors.green[200], // Set the desired background color here
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                TextField(
                 onChanged: (value){
                   userEmail = value;
                 },
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16.0),
               TextField(
                onChanged: (value) {
                  userPass = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  bool validate = await validateLogin(userEmail,userPass) ;
                  if(validate){
                    Navigator.pushNamedAndRemoveUntil(context, '/loadingScreen', (route) => false);
                  }
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
