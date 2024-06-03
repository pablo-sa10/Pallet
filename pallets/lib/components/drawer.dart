import 'package:flutter/material.dart';
import 'package:pallets/pages/configuracoes.dart';
import 'package:pallets/theme/app_colors.dart';
import 'package:pallets/theme/app_theme.dart';
import 'package:pallets/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Center(
            child: Text(
              "aaa",
              style: themeProvider.isDarkTheme
                  ? AppTheme.darkTheme.textTheme.titleMedium
                  : AppTheme.lightTheme.textTheme.titleMedium,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            "Perfil",
            style: themeProvider.isDarkTheme
                ? AppTheme.darkTheme.textTheme.titleMedium
                : AppTheme.lightTheme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          onTap: (){},
        ),ListTile(
          leading: Icon(Icons.person),
          title: Text(
            "Teste",
            textAlign: TextAlign.center,
          ),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            "Configurações",
            style: themeProvider.isDarkTheme
                ? AppTheme.darkTheme.textTheme.titleMedium
                : AppTheme.lightTheme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          onTap: (){
            Navigator.of(context).pushNamed("/Config");
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            "Sair",
            style: themeProvider.isDarkTheme
                ? AppTheme.darkTheme.textTheme.titleMedium
                : AppTheme.lightTheme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          onTap: (){},
        ),
      ]),
    );
  }
}
