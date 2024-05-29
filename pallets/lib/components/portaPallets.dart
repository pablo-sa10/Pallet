import 'package:flutter/material.dart';

class Portapallets extends StatefulWidget {
  final int colunas;
  final int andares;
  final int itemCount;
  final int end_id;

  const Portapallets(
      {super.key,
      required this.colunas,
      required this.andares,
      required this.itemCount,
      required this.end_id});

  @override
  State<Portapallets> createState() => _PortapalletsState();
}

class _PortapalletsState extends State<Portapallets> {
  final List<List<int>> posicoes = [
    [1, 0, 1, 0],
    [1, 0, 1, 1],
    [1, 0, 0, 0],
    [1, 1, 1, 0],
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Column(
          children: [
            Text(
              "Porta Pallets com ${widget.colunas} Colunas e ${widget.andares} Andares",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.colunas > 0 ? widget.colunas : 3,
                ),
                itemCount: widget.itemCount,
                itemBuilder: (context, index) {
                  int row = index ~/ widget.colunas;
                  int col = index % widget.colunas;
                  bool cardExternoPreenchido =
                      posicoes.any((pos) => pos[0] == row && pos[1] == col);
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 1)),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, subIndex) {
                        int subRow = subIndex ~/ 2;
                        int subCol = subIndex % 2;
                        bool cardInternoPreenchido = posicoes.any((pos) =>
                            pos[0] == row &&
                            pos[1] == col &&
                            pos[2] == subRow &&
                            pos[3] == subCol);
                        return Card(
                          //elevation: 4,
                          child: PosicaoPalletsPreenchidas(
                            row: row,
                            col: col,
                            subRow: subRow,
                            subCol: subCol,
                            cardExternoPreenchido: cardExternoPreenchido,
                            cardInternoPreenchido: cardInternoPreenchido,
                          ),
                        );
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Center(child: Text('Pegadinha'))
      ],
    );
  }
}

class PosicaoPalletsPreenchidas extends StatelessWidget {
  final int row;
  final int col;
  final int subRow;
  final int subCol;
  final bool cardExternoPreenchido;
  final bool cardInternoPreenchido;

  const PosicaoPalletsPreenchidas(
      {super.key,
      required this.row,
      required this.col,
      required this.subRow,
      required this.subCol,
      required this.cardExternoPreenchido,
      required this.cardInternoPreenchido});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardInternoPreenchido ? Colors.red : Colors.green,
        //border: Border.all(color: Colors.amber, width: 2),
      ),
      // child: Center(
      //   child: Column(
      //     children: [
      //       Text('index: $index', style: const TextStyle(fontSize: 20)),
      //       Text('linha: $row', style: const TextStyle(fontSize: 20)),
      //       Text('coluna: $col', style: const TextStyle(fontSize: 20)),
      //     ],
      //   ),
      // ),
    );
  }
}
