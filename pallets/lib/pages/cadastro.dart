import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool enabled = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _qtdColunas = TextEditingController();
  final TextEditingController _qtdAndares = TextEditingController();
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
                autofocus: true,
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
                    labelStyle: TextStyle(fontSize: 20, color: Colors.white),
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
                  print(newValue);
                  setState(() {
                    if(newValue == "Ruas"){
                      enabled = false;
                    }else{
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
                    labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                value: _posicao,
                items: <dynamic>[1, 2, "Nulo"].map(
                  (dynamic value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text("$value"),
                    );
                  },
                ).toList(),
                onChanged: (newValue) {
                  setState(
                    () {
                      _posicao = newValue;
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
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
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text("Registro feito"))
                    // );
                    print(_nomeController.text);
                    print(_tipo);
                    print(_qtdColunas.text);
                    print(_qtdAndares.text);
                    print(_posicao);
                  }
                },
                child: Text("Adicionar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
