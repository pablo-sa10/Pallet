import 'package:flutter/material.dart';
import 'package:pallets/components/botoes.dart';
import 'package:pallets/components/tipo.dart';

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
        title: const Text("Pallets Teste"),
        centerTitle: true,
      ),
      drawer: Drawer(

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
    );
  }

  void onButtonAdd(BuildContext context){
    Navigator.of(context).pushNamed("/Cadastro");
  }
}
