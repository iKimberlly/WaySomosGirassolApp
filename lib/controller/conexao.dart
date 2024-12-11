import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Conexao {
  Future<Database> getConexao() async {
    final dbPath = join(await getDatabasesPath(), 'app.db');
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int versao) async {
        await db.execute(''' 
          CREATE TABLE IF NOT EXISTS usuario (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT NOT NULL UNIQUE,
            senha TEXT NOT NULL
          );
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS psicologo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            crp TEXT UNIQUE,
            nome TEXT NOT NULL,
            email TEXT NOT NULL,
            especialidades TEXT,
            dias TEXT,
            horario TEXT
          );
        ''');
      },
      onOpen: (db) async {
        print("--> Banco de dados aberto: $dbPath");
      },
    );
  }
}
