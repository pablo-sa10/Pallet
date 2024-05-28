import 'package:flutter/material.dart';

import '../models/conexao.dart';

class Cadastro extends StatefulWidget {

  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  bool enabled = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  TextEditingController _qtdColunas = TextEditingController();
  TextEditingController _qtdAndares = TextEditingController();
  bool isRua = false;
  String? _tipo;
  dynamic _posicao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              //Form Nome
              TextFormField(
                controller: _nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira um Nome";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 40,
              ),
              //Tipo
              DropdownButtonFormField(
                decoration: InputDecoration(
                    labelText: "Escolha um tipo",
                    labelStyle: const TextStyle(fontSize: 20, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                value: _tipo,
                items: <String>["Porta Pallets", "Ruas"].map(
                  (String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (newValue) {
                  setState(() {
                    if(newValue == "Ruas"){
                      _qtdColunas.text = "";
                      _qtdAndares.text = "";
                      enabled = false;
                      isRua = true;
                    }else{
                      isRua = false;
                      _posicao = null;
                      enabled = true;
                    }
                    _tipo = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Selecione uma opção";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // Form Colunas
              TextFormField(
                enabled: enabled,
                controller: _qtdColunas,
                validator: (value) {
                  if (enabled == true && (value == null || value.isEmpty)) {
                    return "Por favor, insira a quantidade de colunas";
                  }
                  return null;
                },
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Quantidade de Colunas",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              //Form Andares
              TextFormField(
                enabled: enabled,
                controller: _qtdAndares,
                validator: (value) {
                  if (enabled == true && (value == null || value.isEmpty)) {
                    return "Por favor, insira a quantidade de andares";
                  }
                  return null;
                },
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Quantidade de Andares",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                    labelText: "Escolha a Posição da Rua",
                    labelStyle: const TextStyle(fontSize: 20, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                value: _posicao,
                items: <int>[1, 2].map(
                  (int value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text("$value"),
                    );
                  },
                ).toList(),
                onChanged: isRua ? (newValue) {
                  setState(
                    () {
                      _posicao = newValue;
                    },
                  );
                } : null,
                validator: (value) {
                  if (isRua && value == null) {
                    return "Selecione uma opção";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    final nome = _nomeController.text;
                    final tipo = _tipo;
                    final qtdColunas = _qtdColunas.text;
                    final qtdAndares = _qtdAndares.text;
                    final posicao = _posicao;

                    _inserirDados(nome, tipo, qtdColunas, qtdAndares, posicao);

                  }
                },
                child: const Text("Adicionar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _inserirDados(String nome, String? tipo, dynamic colunas, dynamic andares, dynamic posicao) async{
    bool? sucesso = await Conexao.inserirDados(nome, tipo, colunas, andares, posicao);

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: sucesso == true ? const Text("Registro feito com sucesso!") : const Text("Erro ao inserir os dados!"))
    );
    Navigator.of(context).pop("/");
  }
}
