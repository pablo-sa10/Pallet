import 'package:flutter/cupertino.dart';
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
        for(int i = 1; i < 3; i++)
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Text(
                "Rua $i",
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
                    for(int i = 1; i < 5; i++)
                      Container(
                        color: Colors.green,
                        width: 100,
                        height: 100,
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
