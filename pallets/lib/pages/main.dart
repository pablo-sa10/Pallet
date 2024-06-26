import 'package:firebase_core/firebase_core.dart';
import 'package:pallets/components/auth_check.dart';
import 'package:pallets/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:pallets/models/authentic.dart';
import 'package:pallets/pages/configuracoes.dart';
import 'package:pallets/pages/login.dart';
import 'package:pallets/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';
import 'home.dart';
import 'cadastro.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();

  //busca o ultimo tema salvo pelo usuario
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDark = prefs.getBool('isDarkTheme') ?? false;

  ThemeProvider themeProvider = ThemeProvider(isDark);
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: themeProvider),
          //ChangeNotifierProvider(create: (context) => ThemeProvider(isDark)),
          ChangeNotifierProvider(create: (context) => AuthService()),
        ],
        child: MyApp(),
      )
    // ChangeNotifierProvider.value(
    //   value: themeProvider,
    //   child: const MyApp(),
    // ),
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
        theme: themeProvider.isDarkTheme ? AppTheme.darkTheme : AppTheme
            .lightTheme,
        //theme: themeProvider.isDarkTheme ? MaterialTheme.darkScheme() : AppTheme.lightTheme,
        initialRoute: '/AuthCheck',
        routes: {
          '/': (context) => const Home(),
          //'/Login': (context) const =>
          "/Cadastro": (context) => const Cadastro(),
          "/Config": (context) => const Configuracoes(),
          "/Login": (context) => const Login(),
          "/AuthCheck": (context) => const AuthCheck(),
        },
      );
    });
  }
}
