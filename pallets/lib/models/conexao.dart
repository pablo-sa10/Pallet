import 'package:http/http.dart' as http;
import 'dart:convert';

class Conexao{

  static Future<List<dynamic>> ultimosDadosPallets() async {
    final response = await http.get(Uri.parse('http://10.10.2.173/taramps/models/dados.php?action=obterDados'));
    if (response.statusCode == 200) {
      // Decodificar os dados JSON
      List data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Falha ao carregar os dados');
    }
  }

  static Future<List<dynamic>> posicoesPreenchidasPallet(int end_id) async{
    final response = await http.get(Uri.parse('http://10.10.2.173/taramps/models/dados.php?action=posicoesPreenchidas&end_id=$end_id'));

    if (response.statusCode == 200) {
      // Decodificar os dados JSON
      List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Falha ao carregar os dados');
    }
  }

  static Future<List<dynamic>> ultimosDadosRuas() async {
    final response = await http.get(Uri.parse('http://10.10.2.173/taramps/models/dados.php?action=ultimosDadosRua'));
    print(response.body);

    if (response.statusCode == 200) {
      // Decodificar os dados JSON
      List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Falha ao carregar os dados');
    }
  }

  static Future<List<dynamic>>posicoesPreenchidasRua(int end_id_rua1, int end_id_rua2) async{
    final response = await http.get(Uri.parse('http://10.10.2.173/taramps/models/dados.php?action=posicoesPreenchidasRuas'));
    return [];
    print(response.body);
  }

  static Future<bool?> inserirDados(String nome, String? tipo, dynamic colunas, dynamic andares, dynamic posicao) async{
    print('nome: ${nome.runtimeType} $nome');
    print('tipo: ${tipo.runtimeType} $tipo');
    print('colunas: ${colunas.runtimeType} $colunas');
    print('andares: ${andares.runtimeType} $andares');
    print('posição: ${posicao.runtimeType} $posicao');

    final response = await http.post(
      Uri.parse('http://10.10.2.173/taramps/models/dados.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nome' : nome,
        'tipo' : tipo,
        'colunas' : colunas,
        'andares' : andares,
        'posicao' : posicao,
      }),
    );

    if(response.statusCode == 200){
      final responseJson = jsonDecode(response.body);
      if(responseJson['status'] == 'sucesso'){
        return true;
      }else{
        return false;
      }
    }else{
      throw Exception('Falha nessa bct');
    }
  }

}
