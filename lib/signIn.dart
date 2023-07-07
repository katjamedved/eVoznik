import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key});


  bool validateLogin(String email, String password) {
    if (email.isEmpty) {
      return false;
    }
    if (password.isEmpty || password.length < 6) {
      return false;
    }
    // validation checks
    return true;
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
                onPressed: () {
                  bool validate = validateLogin("email", "password");
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
