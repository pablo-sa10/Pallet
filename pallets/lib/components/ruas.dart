import 'package:flutter/material.dart';

class Ruas extends StatefulWidget {
  final List posicaoRua1;
  final List posicaoRua2;
  const Ruas({super.key, required this.posicaoRua1, required this.posicaoRua2});

  @override
  State<Ruas> createState() => _RuasState();
}

class _RuasState extends State<Ruas> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        for(int i = 0; i < 2; i++)
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Text(
                "Rua ${i + 1}",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 50,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.amber
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for(int j = 0; j < 5; j++)
                      Container(
                        color: (i == 0 && widget.posicaoRua1.any((item) => item['esp_posicao_rua'] == j)) ||
                        (i == 1 && widget.posicaoRua2.any((item) => item['esp_posicao_rua'] == j)) ? Colors.red : Colors.green,
                        //color: Colors.green,
                        width: 70,
                        height: 70,
                      ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
