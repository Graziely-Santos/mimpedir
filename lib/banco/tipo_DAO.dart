import 'package:mimpedir/banco/database_helper.dart';
import '../tipo.dart';

class TipoDAO{

  static Future<Tipo> listar(int? id) async {
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_tipo',
      where: 'cd_tipo = ?',
      whereArgs: [id]
    );
    return Tipo(
      codigo:resultado.first['cd_tipo'] as int,
      nome: resultado.first['nm_tipo'] as String
    );
  }

  static Future<List<Tipo>> listarTipos() async{
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_tipo');

    return resultado.map((mapa){
      return Tipo(
        codigo: mapa['cd_tipo'] as int,
        nome: mapa['nm_tipo'] as String
      );
    }).toList();
    }
  }


