import 'package:flutter/material.dart';

class Portas extends StatefulWidget {
  final int portaSelecionada;

  const Portas({super.key, required this.portaSelecionada});

  @override
  State<Portas> createState() => _PortasState();
}

class _PortasState extends State<Portas> {
  final List<List<int>> posicoes = [
    [2, 1],
    [2, 2],
    [2, 0],
    [1, 0],
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(child: getPorta(widget.portaSelecionada));
  }

  Widget getPorta(int porta) {
    switch (porta) {
      case 1:
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            int row = index ~/ 3;
            int col = index % 3;
            bool isFilled =
            posicoes.any((pos) => pos[0] == row && pos[1] == col);
            return PosicaoPalletsPreenchidas(
              row: row,
              col: col,
              isFilled: isFilled,
              index: index,
              space: 1,
            );
          },
        );
      default:
        return const Text("Selcione alguma coisa");
    }
  }
}

class PosicaoPalletsPreenchidas extends StatelessWidget {
  final int row;
  final int col;
  final int space;
  final int index;
  final bool isFilled;

  const PosicaoPalletsPreenchidas({super.key,
    required this.row,
    required this.col,
    required this.isFilled,
    required this.index,
    required this.space});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isFilled ? Colors.red : Colors.grey,
          border: Border.all(color: Colors.amber, width: 2)),
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
