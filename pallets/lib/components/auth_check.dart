import 'package:flutter/material.dart';
import 'package:pallets/models/authentic.dart';
import 'package:provider/provider.dart';

import '../pages/home.dart';
import '../pages/login.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading) {
      return loading();
    } else if(auth.usuario == null)
      return Login();
    else
      return Home();
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
