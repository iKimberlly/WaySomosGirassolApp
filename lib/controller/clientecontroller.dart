import 'package:waysomosgirasol/controller/conexao.dart';
import 'package:waysomosgirasol/model/clientemodel.dart';
import 'package:sqflite/sqflite.dart';

class ClienteController extends Conexao {
  // Remover redundância na variável `view`
  ClienteController(this.view);

  final Map<String, dynamic> view;

  /// Método para inserir um cliente no banco de dados
  Future<int> inserir() async {
    try {
      final Database db = await Conexao().getConexao();

      final cliente = ClienteModel(
        nome: view['nome'],
        email: view['email'],
        senha: view['senha'],
      );

      return await db.insert(
        "usuario",
        cliente.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      ); // Retorna o ID da linha inserida
    } catch (erro) {
      print("--> Erro ao inserir cliente: $erro");
      return -1; // Retorna -1 em caso de erro
    }
  }

  /// Método para obter a lista de todos os clientes cadastrados
  Future<List<ClienteModel>> getCliente() async {
    try {
      final Database db = await Conexao().getConexao();

      // Consulta todos os registros da tabela "usuario"
      final List<Map<String, dynamic>> maps = await db.query("usuario");

      // Converte os mapas para objetos ClienteModel
      return List.generate(maps.length, (index) {
        return ClienteModel.fromMap(maps[index]);
      });
    } catch (erro) {
      print("--> Erro ao listar clientes: $erro");
      return [];
    }
  }

  /// Método para autenticar um cliente
  Future<bool> autenticar(String email, String senha) async {
    try {
      final Database db = await Conexao().getConexao();

      // Realiza a consulta no banco para verificar se existe um usuário com esse email e senha
      final List<Map<String, dynamic>> result = await db.query(
        'usuario',
        where: 'email = ? AND senha = ?',
        whereArgs: [email, senha],
      );

      // Se a consulta retornar algum resultado, significa que o usuário existe
      return result.isNotEmpty;
    } catch (erro) {
      print("--> Erro ao autenticar usuário: $erro");
      return false;
    }
  }

  /// Método de depuração para exibir clientes no console
  void listarClientes() async {
    List<ClienteModel> clientes = await getCliente();
    print("Clientes cadastrados:");
    for (var cliente in clientes) {
      print(cliente.toMap());
    }
  }
}
