import 'package:e_vozniska/server/serverConnection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/TokenManeger.dart';

class StartUp extends StatelessWidget {
  const StartUp({Key? key});

  @override
  Widget build(BuildContext context) {
    final tokenManager = Provider.of<TokenManager>(context, listen: false);

    Future.delayed(const Duration(milliseconds: 900), () async {
     String? token = await tokenManager.getToken();
     ServerConnection serverConnection = ServerConnection();
     if(token != null){
       bool _validToken = await serverConnection.verifyTokenWithServer(token, tokenManager);
       if(_validToken){
         print("VALID TOKEN");
         Navigator.pushNamedAndRemoveUntil(context, '/loadingScreen', (route) => false);
       }else{
         print("TOKEN IS NOT VALID");
         Navigator.pushNamedAndRemoveUntil(context, '/signIn', (route) => false);
       }
     }else{
       print("NO TOKEN WAS SAVED");
       Navigator.pushNamedAndRemoveUntil(context, '/signIn', (route) => false);
     }
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
