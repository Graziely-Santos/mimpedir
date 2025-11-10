import 'package:mimpedir/banco/database_helper.dart';
import 'package:mimpedir/banco/tipo_DAO.dart';
import 'package:mimpedir/banco/usuario_dao.dart';
import '../restaurante.dart';
import 'package:mimpedir/tipo.dart';


class RestauranteDAO {

  static Future<void> atualizar(String? nome, String? latitude,
      String? longitude, int? tipo) async {
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.update('tb_restaurante', {
      'nn_restaurante': nome,
      'latiude_restaurante': latitude,
      'longitude_restaurante': longitude,
      'cd_tipo': tipo,
    },
        where: 'cd_restaurante = ?',
        whereArgs: [cd]
    );
  }

  static Future<Restaurante> listar(int? cd) async {
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_restaurante',
        where: 'cd_restaurante = ?',
        whereArgs: [cd]
    );
    return Restaurante(
        codigo: resultado.first['cd_restaurante'] as int,
        nomeRestaurante: resultado.first['nm_restaurante'] as String,
        latitude: resultado.first['latitude_restaurante'] as String,
        longitude: resultado.first['longitude_restaurante'] as String,
        tipoCulinaria: await TipoDAO.listar(
            resultado.first['cd_tipo'] as int) as Tipo
    );
  }

  static Future<List<Restaurante>> listartodos() async {
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_restaurante',
        where: 'cd_usuario = ?',
        whereArgs: [UsuarioDAO.usuariologado.codigo]
    );

    return resultado.map((mapa) {
      return Restaurante(
          codigo: mapa['cd_restaurante'] as int,
          nomeRestaurante: mapa['nm_restaurante'] as String
      );
    }).toList();
  }

  static Future<List<Tipo>> listarTipos() async {
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_tipo');

    return resultado.map((mapa) {
      return Tipo(
        codigo: mapa['cd_tipo'] as int,
        nome: mapa['nm_tipo'] as String
      );
    }).toList();
  }

  static Future<int> cadastrarRestaurante(String? nomeRestaurante,
      String? latitude, String? longitude, int? tipo) async {
    final db = await DatabaseHelper.getDataBase();

    final dadosRestaurante = {
      'cd_usuario': UsuarioDAO.usuariologado.codigo,
      'cd_tipo': tipo,
      'nm_restaurante': nomeRestaurante,
      'latitude_restaurante': latitude,
      'longitude_restaurante': longitude,
    };
    try {
      final idRestaurante = await db.insert('tb_restaurante', dadosRestaurante);
      return idRestaurante;
    } catch (e) {
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }
}