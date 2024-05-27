import 'package:flutter/material.dart';
//import 'package:pallets/models/data_base.dart';
import 'Home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'cadastro.dart';

Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('http://10.10.2.173/taramps/models/dados.php'));

  if (response.statusCode == 200) {
    // Decodificar os dados JSON
    List<dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Falha ao carregar os dados');
  }
}

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
      title: 'AluBank',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        "/Cadastro": (context) => const Cadastro(),
      },
    );
  }
}
