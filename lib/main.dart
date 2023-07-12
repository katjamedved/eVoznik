import 'package:e_vozniska/signIn.dart';
import 'package:e_vozniska/startUp.dart';
import 'package:flutter/material.dart';
import 'package:e_vozniska/loadingScreen.dart';

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
      initialRoute: "/startUp",
      routes: {
        '/loadingScreen': (context) => const LoadingScreen(),
        '/signIn': (context) => const SignIn(),
        '/startUp': (context) => const StartUp(),
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
        title: const Center(
          child: Text(
            "eVoznik",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.green[200],
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the desired color for the icon
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () {
              // Add your desired action here
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.green[200]),
                    child: null,
                  ),
                  ListTile(
                    title: Text(
                      "Dokumentacija",
                      style: TextStyle(
                        color: Colors.green[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    onTap: () {},
                    leading: Icon(
                      Icons.folder,
                      size: 20.0,
                      color: Colors.green[200],
                    ),
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                  ListTile(
                    title: Text(
                      "Pregled",
                      style: TextStyle(
                        color: Colors.green[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    onTap: () {},
                    leading: Icon(
                      Icons.car_rental_rounded,
                      size: 20.0,
                      color: Colors.green[200],
                    ),
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                  ListTile(
                    title: Text(
                      "Moj instruktor",
                      style: TextStyle(
                        color: Colors.green[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    leading: Icon(
                      Icons.school,
                      size: 20.0,
                      color: Colors.green[200],
                    ),
                    onTap: () {},
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                  ListTile(
                    title: Text(
                      "Instruktorji",
                      style: TextStyle(
                        color: Colors.green[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    leading: Icon(
                      Icons.people,
                      size: 20.0,
                      color: Colors.green[200],
                    ),
                    onTap: () {},
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Nastavitve",
                      style: TextStyle(
                        color: Colors.green[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    leading: Icon(
                      Icons.settings,
                      size: 20.0,
                      color: Colors.green[200],
                    ),
                    onTap: () {},
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                  ListTile(
                    title: Text(
                      "Odjava",
                      style: TextStyle(
                        color: Colors.green[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    leading: Icon(
                      Icons.logout,
                      size: 20.0,
                      color: Colors.green[200],
                    ),
                    onTap: () {},
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
