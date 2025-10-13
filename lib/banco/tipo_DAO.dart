
import 'package:mimpedir/banco/database_helper.dart';

import '../tipo.dart';

class TipoDAO{

  static Future<List<Tipo>> listarTipos() async{
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_tipo');

    }
  }


