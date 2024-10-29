import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bem estar em Mãos - Perfil',
      home: Scaffold(
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
                        image: AssetImage('assets/images/avatar.jpg'), // Sua imagem de perfil
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
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                    
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
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                     
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Color.fromARGB(255, 210, 85, 195),
                      minimumSize: Size(150, 40),
                    ),
                    child: const Text(
                      'Alterar Foto do Perfil',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          selectedItemColor: Color.fromARGB(255, 221, 156, 232),
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
