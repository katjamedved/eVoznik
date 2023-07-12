import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/');
    });
    return Scaffold(
      body: Container(
        color: Colors.green[200],
        child: Center(
          child: Container(
            child: Image.asset(
              "assets/images/car.gif",
              width: 155,
              height: 155,
            ),
          ),
        ),
      ),
    );
  }
}
