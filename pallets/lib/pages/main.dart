import 'package:flutter/material.dart';
import 'Home.dart';
import 'cadastro.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pallets',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        "/Cadastro": (context) => const Cadastro(),
      },
    );
  }
}
