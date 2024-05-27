import 'package:flutter/material.dart';
import 'package:pallets/components/botoes.dart';
import 'package:pallets/components/portas.dart';
import 'package:pallets/pages/cadastro.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int porta = 1;

  void mudarPorta(int portaSelecionada) {
    setState(() {
      porta = portaSelecionada;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pallets Teste"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Botoes(BotaoPressionado: mudarPorta),
            const SizedBox(
              height: 50,
            ),
            Portas(portaSelecionada: porta),
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
