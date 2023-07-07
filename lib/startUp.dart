import 'package:flutter/material.dart';

class StartUp extends StatelessWidget {
  const StartUp({Key? key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/signIn');
    });

    return Scaffold(
      backgroundColor: Colors.green[200],
      body: const Center(
        child: Text(
            "E VOZNIK",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            fontFamily: 'Roboto'
          ),
        ),
      ),
    );
  }
}
