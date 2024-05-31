import 'package:flutter/material.dart';
import 'package:pallets/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import 'cadastro.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDark = prefs.getBool('isDarkTheme') ?? false;

  ThemeProvider themeProvider = ThemeProvider(isDark);
  runApp(
    ChangeNotifierProvider.value(
      value: themeProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
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
    });
  }
}
