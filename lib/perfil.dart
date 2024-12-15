import 'package:bemestaremmaos/database_helper.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String email; // Recebe o email da tela anterior

  const ProfilePage({super.key, required this.email}); // A tela de perfil agora precisa do email


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final user = await _dbHelper.getUserByEmail(widget.email); // Usa o email recebido

      if (user != null) {
        setState(() {
          _nameController.text = user['name'] ?? '';
          _emailController.text = user['email'] ?? '';
          _passwordController.text = user['password'] ?? '';
        });
      } else {
        _showDialog('Erro', 'Usuário não encontrado.');
      }
    } catch (e) {
      _showDialog('Erro', 'Erro ao carregar os dados do usuário.');
    }
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
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/avatar.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color.fromARGB(255, 210, 85, 195),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Nome",
                  prefixIcon:
                      Icon(Icons.person, color: Color.fromARGB(255, 210, 85, 195)),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 221, 156, 232),
                ),
                maxLength: 30,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  prefixIcon:
                      Icon(Icons.email, color: Color.fromARGB(255, 210, 85, 195)),
                ),
                readOnly: true,
              ),
              const SizedBox(height: 20),
              TextField(
               
         
                decoration: InputDecoration(
                  labelText: "Senha",
                  prefixIcon:
                      Icon(Icons.lock, color: Color.fromARGB(255, 210, 85, 195)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
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
                maxLength: 8,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Função para salvar alterações
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 210, 85, 195),
                    foregroundColor: Colors.white,
                    minimumSize: Size(150, 40),
                  ),
                  child: const Text(
                    'Alterar',
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
