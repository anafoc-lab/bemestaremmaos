import 'package:flutter/material.dart';
import 'database_helper.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  Future<void> _registerUser() async {
    final name = _nameController.text.trim();
    final birthdate = _birthdateController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (name.isEmpty || birthdate.isEmpty || email.isEmpty || password.isEmpty) {
      _showDialog('Erro', 'Preencha todos os campos.');
      return;
    }

    if (password != confirmPassword) {
      _showDialog('Erro', 'As senhas não coincidem.');
      return;
    }

    final user = {
      'name': name,
      'birthdate': birthdate,
      'email': email,
      'password': password,
    };

    try {
      final dbHelper = DatabaseHelper();
      await dbHelper.insertUser(user);
      _showDialog('Sucesso', 'Usuário cadastrado com sucesso!');
      _clearFields();
    } catch (e) {
      _showDialog('Erro', 'Não foi possível cadastrar o usuário: $e');
    }
  }

  void _clearFields() {
    _nameController.clear();
    _birthdateController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          width: 350,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Nome",
                  prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 210, 85, 195)),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 221, 156, 232),
                ),
                maxLength: 30,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _birthdateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: "Data de Nascimento",
                  prefixIcon: Icon(Icons.calendar_today, color: Color.fromARGB(255, 210, 85, 195)),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 221, 156, 232),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 210, 85, 195)),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 221, 156, 232),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Senha",
                  prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 210, 85, 195)),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 221, 156, 232),
                ),
                obscureText: !_showPassword,
                maxLength: 8,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Confirmar Senha",
                  prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 210, 85, 195)),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _showConfirmPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onTap: () {
                      setState(() {
                        _showConfirmPassword = !_showConfirmPassword;
                      });
                    },
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 221, 156, 232),
                ),
                obscureText: !_showConfirmPassword,
                maxLength: 8,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 210, 85, 195),
                    foregroundColor: Colors.white,
                    minimumSize: Size(150, 40),
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
