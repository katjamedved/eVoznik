import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:e_vozniska/server/serverConnection.dart';
import 'package:crypto/crypto.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'models/TokenManeger.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key});

  Future<String> hashPass(String pass) async {
    var bytes = utf8.encode(pass);
    String hashPass = sha512.convert(bytes).toString();
    return hashPass;
  }

  @override
  Widget build(BuildContext context) {
    String userEmail = "";
    String userPass = "";
    final tokenManager = Provider.of<TokenManager>(context, listen: false);

    return Scaffold(
      body: Container(
        color: Colors.green[200], // Set the desired background color here
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              const Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 60),

              // Added spacing above the ToggleSwitch
              SizedBox(
                height: 35,
                child: ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20.0,
                  activeBgColors: [ const [Colors.white],  const [Colors.white]],
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.grey[300],
                  inactiveFgColor: Colors.black,
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: const ['Driver', 'Instructor'],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ),
              SizedBox(height: 80.0),
              TextField(
                onChanged: (value) {
                  userEmail = value;
                },
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey, // Set the desired border color
                      width: 1.0, // Set the desired border width
                    ),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  labelText: 'Email',
                ),
              ),

              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) async {
                  userPass = value ; //await hashPass(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(

                    borderSide: const BorderSide(
                      color: Colors.grey, // Set the desired border color
                      width: 1.0, // Set the desired border width
                    ),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 100.0),
              Container(
                width: 190, // Set the desired width to fill the available space
                child: ElevatedButton(
                  onPressed: () async {
    /*                print("Disabled auth for application testing");
                    Navigator.pushNamedAndRemoveUntil(context, '/loadingScreen', (route) => false);*/

                    ServerConnection serverConnection = ServerConnection();
                    bool auth = await serverConnection.authenticate(userEmail, userPass,tokenManager);

                    if(auth){
                      Navigator.pushNamedAndRemoveUntil(context, '/loadingScreen', (route) => false);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set the desired background color
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Set the desired border radius
                      ),
                    ),
                  ),
                  child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                  ),
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
