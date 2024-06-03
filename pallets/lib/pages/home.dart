import 'package:flutter/material.dart';
import 'package:pallets/components/botoes.dart';
import 'package:pallets/components/drawer.dart';
import 'package:pallets/components/tipo.dart';
import 'package:pallets/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tipo = 1;

  void mudarTipo(int tipoSelecionado) {
    setState(() {
      tipo = tipoSelecionado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(onPressed: (){
        //     Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        //   }, icon: Icon(Icons.brightness_6)),
        // ],
        title: const Text("Pallets Teste"),
        centerTitle: true,
      ),
      drawer: DrawerPage(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 50, 10, 10),
        child: Column(
          children: [
            Botoes(BotaoPressionado: mudarTipo),
            const SizedBox(
              height: 50,
            ),
            Tipos(tipoSelecionado: tipo),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => onButtonAdd(context),
          child: Icon(Icons.add, color: Colors.white,),
        ),
    );
  }

  void onButtonAdd(BuildContext context){
    Navigator.of(context).pushNamed("/Cadastro");
  }
}
