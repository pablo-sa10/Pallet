import 'package:flutter/material.dart';
import 'package:pallets/models/conexao.dart';

class Tipos extends StatefulWidget {
  final int tipoSelecionado;

  const Tipos({super.key, required this.tipoSelecionado});

  @override
  State<Tipos> createState() => _TiposState();
}

class _TiposState extends State<Tipos> {
  List dadosPallets = [];
  int colunas = 0;
  int andares = 0;
  int itemCount = 0;
  int end_id = 0;

  void initState() {
    super.initState();
    _ultimosDadosPallets();
    _ultimosDadosRuas();
    _posicoesPreenchidasPallet();
  }

  Future<void> _ultimosDadosPallets() async {
    List dadosRecebidos = await Conexao.ultimosDadosPallets();
    setState(() {
      dadosPallets = dadosRecebidos.map((item){
        return {
          'end_id': int.parse(item['end_id']),
          'end_nome': item['end_nome'],
          'end_tipo': int.parse(item['end_tipo']),
          'end_colunas': item['end_colunas'] != null ? int.parse(item['end_colunas']) : null,
          'end_andar': item['end_andar'] != null ? int.parse(item['end_andar']) : null,
          'end_posicao': item['end_posicao'] != null ? int.parse(item['end_posicao']) : null,
        };
      }).toList();
      colunas = dadosPallets[0]['end_colunas'];
      andares = dadosPallets[0]['end_andar'];
      itemCount = andares * colunas;
    });
    print(dadosRecebidos);
    print('${colunas.runtimeType} $colunas');
  }

  Future<List> _posicoesPreenchidasPallet() async{
    List dados = await Conexao.posicoesPreenchidasPallet(end_id);
    return dados;
  }

  Future<List> _ultimosDadosRuas() async{
    List dadosRuas = await Conexao.ultimosDadosRuas();
    return dadosRuas;
  }

  final List<List<int>> posicoes = [
    [1, 0, 1, 0],
    [1, 0, 1, 1],
    [1, 0, 0, 0],
    [1, 1, 1, 0],
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(child: getPorta(widget.tipoSelecionado));
  }

  Widget getPorta(int tipo) {
    switch (tipo) {
      case 1:
        return Column(
          children: [
            Text(
              "Porta Pallets com $colunas Colunas e $andares Andares",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: colunas,
                ),
                itemCount: itemCount,
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
