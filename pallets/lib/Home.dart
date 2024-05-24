import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<List<int>> posicoes = [
    [2, 1],
    [2, 2],
    [2, 0],
    [1, 0],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pallets Teste"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 170),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            int row = index ~/3;
            int col = index % 3;
            bool isFilled = posicoes.any(
                (pos) => pos[0] == row && pos[1] == col
            );
            return PosicaoPalletsPreenchidas(row: row, col: col, isFilled: isFilled, index: index, space: 1,);
          },
        ),
      ),
    );
  }
}

class PosicaoPalletsPreenchidas extends StatelessWidget {
  final int row;
  final int col;
  final int space;
  final int index;
  final bool isFilled;

  const PosicaoPalletsPreenchidas({super.key, required this.row, required this.col, required this.isFilled, required this.index, required this.space});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isFilled? Colors.red : Colors.grey,
        border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Column(
          children: [
            Text('index: $index', style: const TextStyle(fontSize: 20)),
            Text('linha: $row', style: const TextStyle(fontSize: 20)),
            Text('coluna: $col', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

