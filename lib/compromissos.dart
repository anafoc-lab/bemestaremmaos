import 'compromissos.dart';
import 'periodomenstrual.dart';
import 'saude.dart';
import 'unhas.dart';
import 'package:flutter/material.dart';
import 'perfil.dart';
import 'cabelos.dart';
import 'beleza.dart';
void main() {
  runApp(Compromisso());
}

class Compromisso extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Compromisso> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Compromissos(),
    ProfilePage(),
    NotificationsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   @override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Bem estar em Mãos - Cabelos',
    home: Scaffold(
      backgroundColor: const Color.fromRGBO(255, 241, 241, 1),
      appBar: AppBar(
        title: Text('Bem Estar em Mãos'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 156, 232),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Cabelos'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
            ListTile(
              title: Text('Beleza'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Beleza()),
                );
              },
            ),
            ListTile(
              title: Text('Período Menstrual'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => periodomenstrual()),
                );
              },
            ),
            ListTile(
              title: Text('Saúde'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => saudes()),
                );
              },
            ),
            ListTile(
              title: Text('Unhas'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Unha()),
                );
              },
            ),
             ListTile(
              title: Text('Compromisso'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Compromisso()),
                );
              },
            ),
            
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 221, 156, 232),
        unselectedItemColor: const Color.fromARGB(255, 221, 156, 232),
        backgroundColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
    ),
  );
}
}

class Compromissos extends StatelessWidget {
  final List<String> itemNames = [
    'Cabelos',
    'Beleza',
    'Período Menstrual',
    'Saúde',
    'Unhas',
    'Compromissos',
  ];

  final List<Map<String, String>> commitments = [
    {"title": "Consulta Dermatologista", "time": "10:00 AM"},
    {"title": "Manicure", "time": "2:00 PM"},
    {"title": "Ginástica", "time": "5:30 PM"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              
              const SizedBox(height: 20),
              Text(
                'Agenda de Compromissos',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 210, 85, 195),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: commitments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.event, color: Color.fromARGB(255, 210, 85, 195)),
                    title: Text(commitments[index]["title"]!),
                    subtitle: Text(commitments[index]["time"]!),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ListTile(
            leading: Icon(Icons.notifications, color: Color.fromARGB(255, 210, 85, 195)),
            title: Text("Lembrete 1"),
            subtitle: Text("Você tem um compromisso às 10:00 AM."),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Color.fromARGB(255, 210, 85, 195)),
            title: Text("Lembrete 2"),
            subtitle: Text("Horário de tomar remédio às 2:00 PM."),
          ),
        ],
      ),
    );
  }
}
