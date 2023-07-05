import 'package:e_vozniska/signIn.dart';
import 'package:flutter/material.dart';
import 'package:e_vozniska/startUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eVoznik',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'eVoznik'),
      initialRoute: "/signIn",
      routes: {
        '/startUp': (context) => const StartUp(),
        '/signIn' : (context) => const SignIn(),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Center(
          child: Text("eVoznik"),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: const Text(
        "Home page"
      ),
    );
  }
}
