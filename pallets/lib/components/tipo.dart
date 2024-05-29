import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pallets/components/portaPallets.dart';
import 'package:pallets/components/ruas.dart';
import 'package:pallets/models/conexao.dart';

class Tipos extends StatefulWidget {
  final int tipoSelecionado;

  const Tipos({super.key, required this.tipoSelecionado});

  @override
  State<Tipos> createState() => _TiposState();
}

class _TiposState extends State<Tipos> {
  //pallets
  List<Map<String, dynamic>> dadosPallets = [];
  List<Map<String, dynamic>> posicoesPreenchidas = [];

  //ruas
  List<Map<String, dynamic>> dadosRuas = [];
  int end_id_rua1 = 0;
  int end_id_rua2 = 0;

  //atributos do card externo
  int colunas = 0;
  int andares = 0;
  int itemCount = 0;
  int end_id = 0;

  //atributos do card interno
  int colunaInterna = 0;
  int andarInterno = 0;
  int posicoesOcupadas = 0;
  int itemCountInterno = 0;
  int ruaPosicao = 0;

  void initState() {
    super.initState();
    _loadData();
  }

  Future<void>_loadData() async{
    await _ultimosDadosPallets();
    if(end_id > 0){
      await _posicoesPreenchidasPallet(end_id);
    }
    await _ultimosDadosRuas();
    await _posicoesPreenchidasRua(end_id_rua1, end_id_rua2);
  }

  Future<void> _ultimosDadosPallets() async {
    List dadosRecebidos = await Conexao.ultimosDadosPallets();
    print(dadosRecebidos);

      List<Map<String, dynamic>> converteData = dadosRecebidos.map((item) {
        return {
          'end_id': int.parse(item['end_id']),
          'end_nome': item['end_nome'],
          'end_tipo': int.parse(item['end_tipo']),
          'end_colunas': item['end_colunas'] != null
              ? int.parse(item['end_colunas'])
              : null,
          'end_andar':
              item['end_andar'] != null ? int.parse(item['end_andar']) : null,
          'end_posicao': item['end_posicao'] != null
              ? int.parse(item['end_posicao'])
              : null,
        };
      }).toList();
      setState(() {
        dadosPallets = converteData;
        if(dadosPallets.isNotEmpty){
          colunas = dadosPallets[0]['end_colunas'];
          andares = dadosPallets[0]['end_andar'];
          itemCount = andares * colunas;
          end_id = dadosPallets[0]['end_id'];
        }
      });
  }

  Future<void> _posicoesPreenchidasPallet(int end_id) async {
    List dados = await Conexao.posicoesPreenchidasPallet(end_id);
    print(dados);

      List<Map<String, dynamic>>converteData = dados.map((item) {
        return {
          'esp_id': int.parse(item['esp_id']),
          'end_id': int.parse(item['end_id']),
          'esp_tipo': int.parse(item['esp_tipo']),
          'esp_coluna':
              item['esp_coluna'] != null ? int.parse(item['esp_coluna']) : null,
          'esp_andar':
              item['esp_andar'] != null ? int.parse(item['esp_andar']) : null,
          'esp_posicao_porta': item['esp_posicao_porta'] != null
              ? int.parse(item['esp_posicao_porta'])
              : null,
          'esp_posicao_rua': item['esp_posicao_rua'] != null
              ? int.parse(item['esp_posicao_rua'])
              : null,
        };
      }).toList();

      setState(() {
        dados = converteData;
        colunaInterna = dados[0]['esp_coluna'];
        andarInterno = dados[0]['esp_andar'];
        itemCountInterno = colunaInterna * andarInterno;
        posicoesOcupadas = dados[0]['esp_posicao_porta'];
      });
  }

  Future<void> _ultimosDadosRuas() async {
    List dadosRuas = await Conexao.ultimosDadosRuas();
    List<Map<String, dynamic>>converter = dadosRuas.map((item){
      return{
        'end_id': int.parse(item['end_id']),
      };
    }).toList();
    setState(() {
      dadosRuas = converter;
      if(dadosRuas[0]['posicao'] == "1"){
        end_id_rua1 = dadosRuas[0]['end_id'];
        end_id_rua2 = dadosRuas[1]['end_id'];
      }else{
        end_id_rua1 = dadosRuas[1]['end_id'];
        end_id_rua2 = dadosRuas[0]['end_id'];
      }
    });
    print(dadosRuas);
  }

  Future<void> _posicoesPreenchidasRua(int end_rua1, int end_rua2) async{
    List dados = await Conexao.posicoesPreenchidasRua(end_id_rua1, end_id_rua2);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: getTipo(widget.tipoSelecionado));
  }

  Widget getTipo(int tipo) {
    switch (tipo) {
      case 1:
        return Portapallets(colunas: colunas, andares: andares, itemCount: itemCount, end_id: end_id);

      default:
        return Ruas(posicaoRua1: [1], posicaoRua2: [2],);
    }
  }
}

