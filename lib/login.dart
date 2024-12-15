import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'database_helper.dart';
import 'tela1.dart';
import 'cadastro.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bem Estar em Mãos',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/cadastro': (context) => Cadastro(),
        '/home': (context) => Tela1(),
      },
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 210, 85, 195),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showDialog('Erro', 'Preencha todos os campos.');
      return;
    }

    try {
      final user = await _dbHelper.getUserByEmail(email);

      if (user != null) {
        // Verifica a senha usando o mesmo hash usado no cadastro
        final hashedPassword = _dbHelper.hashPassword(password);
        if (hashedPassword == user['password']) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          _showDialog('Erro', 'Senha incorreta.');
        }
      } else {
        _showDialog('Erro', 'Usuário não encontrado.');
      }
    } catch (e) {
      _showDialog('Erro', 'Erro ao tentar fazer login: $e');
    }
  }

  void _navigateToCadastro() {
    Navigator.pushNamed(context, '/cadastro');
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 241, 241, 1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 30),
                  obscureText: !_showPassword,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 210, 85, 195),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _navigateToCadastro,
                child: Text('Cadastrar-se'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 210, 85, 195),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
