import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class DatabaseHelper {

  
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'app.db');

      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE users (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              birthdate TEXT,
              email TEXT UNIQUE,
              password TEXT
            )
          ''');
        },
      );
    } catch (e) {
      print('Erro ao inicializar o banco de dados: $e');
      rethrow;
    }
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    try {
      final db = await database;
      return await db.insert('users', user);
    } catch (e) {
      print('Erro ao inserir usuário: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    try {
      final db = await database;
      final result = await db.query(
        'users',
        where: 'email = ?',
        whereArgs: [email],
      );
      return result.isNotEmpty ? result.first : null;
    } catch (e) {
      print('Erro ao buscar usuário por email: $e');
      rethrow;
    }
  }

  String hashPassword(String password) {
    try {
      final bytes = utf8.encode(password);
      return sha256.convert(bytes).toString();
    } catch (e) {
      print('Erro ao gerar hash da senha: $e');
      rethrow;
    }
  }
}
