import 'package:sqflite/sqflite.dart';
import 'conexao.dart';
import '../model/psimodel.dart';

class PsiController extends Conexao {
  final Map<String, dynamic> view;

  PsiController(this.view);

  Future<int> inserir() async {
    try {
      final Database db = await Conexao().getConexao();
      final psi = PsiModel(
        nome: view['nome'],
        crp: view['crp'],
        email: view['email'],
        especialidades: view['especialidades'],
        dias: view['dias'],
        horario: view['horario'],
      );
      return await db.insert(
        "psicologo",
        psi.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("--> Erro ao inserir: $e");
      return -1;
    }
  }

  Future<List<PsiModel>> getPsi() async {
    try {
      final Database db = await Conexao().getConexao();
      List<Map<String, dynamic>> maps = await db.query("psicologo");

      return List.generate(maps.length, (index) {
        return PsiModel.fromMap(maps[index]);
      });
    } catch (e) {
      print("--> Erro ao listar: $e");
      return [];
    }
  }
}
