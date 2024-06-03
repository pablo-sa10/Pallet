import 'package:flutter/material.dart';
import 'package:pallets/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView(
          children: [
            for (int i = 0; i < 5; i++)
              ListTile(
                title: Text("Mudar tema ", textAlign: TextAlign.center,),
                trailing: IconButton(
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                  icon: Icon(themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode),
                ),
              )
          ],
        ),
      ),
    );
  }
}
