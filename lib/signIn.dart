import 'dart:convert';

import 'package:e_vozniska/mysql/mysqlConnection.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key});

  Future<bool> validateLogin(String email, String password) async {
    var mySql = Mysql();
    if (email.isEmpty) {
      print("Email is empty");
      return false;
    }
    if (password.isEmpty) {
      print("Password is empty");
      return false;
    }
    try {
      final conn = await mySql.getConnection();
      final results =
      await conn.query("SELECT password FROM signin_data WHERE email = ?", [email]);

      if (results.isEmpty) {
        return false;
      } else {
        if (results.length == 1) {
          for (var row in results) {
            if (row[0] == password) {
              return true;
            }
          }
        }
      }
    } catch (e) {
      print("Error connecting to MySQL database: $e");
      return false;
    }
    return false;
  }

  Future<String> hashPass(String pass) async {
    var bytes = utf8.encode(pass);
    String hashPass = sha512.convert(bytes).toString();
    return hashPass;
  }

  @override
  Widget build(BuildContext context) {
    String userEmail = "";
    String userPass = "";

    return Scaffold(
      body: Container(
        color: Colors.green[200], // Set the desired background color here
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 150), // Added spacing above the ToggleSwitch
              SizedBox(
                height: 35,
                child: ToggleSwitch(
                  minWidth: 110.0,
                  cornerRadius: 20.0,
                  activeBgColors: const [[Colors.lightGreenAccent], [Colors.lightGreenAccent]],
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.grey[200],
                  inactiveFgColor: Colors.black,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: const ['Driver', 'Instructor'],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ),
              SizedBox(height: 70.0),
              TextField(
                onChanged: (value) {
                  userEmail = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) async {
                  userPass = await hashPass(userPass);
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 100.0),
              ElevatedButton(
                onPressed: () async {
                  bool validate = await validateLogin(userEmail, userPass);
                  if (validate) {
                    Navigator.pushNamedAndRemoveUntil(context, '/loadingScreen', (route) => false);
                  }
                },
                child: const Text('Sign In'),
                style:  ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreenAccent), // Set the desired background colo
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),))// r
                ),
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      resizeToAvoidBottomInset: false,
    );
  }
}
