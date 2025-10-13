import 'package:mimpedir/banco/database_helper.dart';
import 'package:mimpedir/banco/usuario_dao.dart';

import '../restaurante.dart';

static Future<int> cadastrarRestaurante(
String? nome, String? latitude, String? longitude, int? tipo) async {
  final db = await DatabaseHelper.getDataBase();

  final dadosRestaurante = {
    'nn_restaurante': nome,
    'latiude_restaurante': latitude,
    'longitude_restaurante': longitude,
    'cd_tipo': tipo,
    'cd_usuario': UsuarioDAO.usuariologado.codigo
  };

  try{
    final idRestaurante = await db.insert('tb_restaurante', dadosRestaurante);
    return idRestaurante;
  }catch(e){
    print("Erro ao cadastrar: $e");
    return -1;
  }
}