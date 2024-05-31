import 'package:flutter/material.dart';
import 'package:pallets/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import 'cadastro.dart';

Future<void> main() async {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pallets',
          theme: themeProvider.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
          initialRoute: '/',
          routes: {
            '/': (context) => const Home(),
            "/Cadastro": (context) => const Cadastro(),
          },
        );
      }
    );
  }
}
