import 'package:flutter/material.dart';

class Portas extends StatefulWidget {
  final int portaSelecionada;

  const Portas({super.key, required this.portaSelecionada});

  @override
  State<Portas> createState() => _PortasState();
}

class _PortasState extends State<Portas> {
  final List<List<int>> posicoes = [
    [1, 0, 1, 0],
    [1, 0, 1, 1],
    [1, 0, 0, 0],
    [1, 1, 1, 0],
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(child: getPorta(widget.portaSelecionada));
  }

  Widget getPorta(int porta) {
    switch (porta) {
      case 1:
        return Column(
          children: [
            Text(
              "Porta Pallets com 3 Colunas e 2 Andares",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: 50,),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  bool cardExternoPreenchido =
                      posicoes.any((pos) => pos[0] == row && pos[1] == col);
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 1)),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
        );

      default:
        return const Text("Selcione alguma coisa");
    }
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
