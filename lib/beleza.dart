import 'compromissos.dart';
import 'periodomenstrual.dart';
import 'saude.dart';
import 'unhas.dart';
import 'package:flutter/material.dart';
import 'perfil.dart';
import 'cabelos.dart';


void main() {
  runApp(Beleza());
}

class Beleza extends StatefulWidget {
  const Beleza({super.key});

  @override
  _BelezaState createState() => _BelezaState();
}

class _BelezaState extends State<Beleza> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Beleza1(),
    ProfilePage(email: '',),
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
      title: 'Bem Estar em Mãos - Beleza',
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

class Beleza1 extends StatelessWidget {
  final List<String> itemNames = [
    'Cabelos',
    'Beleza',
    'Período Menstrual',
    'Saúde',
    'Unhas',
    'Compromissos',
  ];

  Beleza1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Sessão: Beleza',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 221, 156, 232),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CurvaturaDetailPage()),
                  );
                },
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/pele.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Rotina de cuidados com a pele: ',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 210, 85, 195),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage(title: 'Skin Care')),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 241, 241, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: 100,
                          height: 120,
                          child: Image.asset(
                            'assets/images/skincare.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Descubra a rotina de skyn care ideal para seu tipo de pele',
                          style: TextStyle(color: Color.fromARGB(255, 210, 85, 195), fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReconstrucaoDetailPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 241, 241, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: 100,
                          height: 120,
                          child: Image.asset(
                            'assets/images/hidratacaopele.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Descubra a diferença que a hidratação fará na sua rotina',
                          style: TextStyle(color: Color.fromARGB(255, 210, 85, 195), fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvaturaDetailPage extends StatelessWidget {
  const CurvaturaDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuidados'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'Rotina de Cuidados com a pele',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 221, 156, 232),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'assets/images/pele.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Aqui estão algumas dicas essenciais de skincare (cuidados com a pele) para manter a pele saudável, limpa e com aspecto rejuvenescido:\n\n\n'
              '1. Conheça Seu Tipo de Pele\nAntes de começar qualquer rotina de skincare, é importante entender qual é o seu tipo de pele para escolher os produtos adequados.\n\n'
              '2. Limpeza Diária\nLimpar o rosto ao menos duas vezes por dia é fundamental para remover sujeiras, oleosidade e células mortas. Escolha um sabonete adequado para seu tipo de pele.\n\n'
              '3. Hidratação\nA hidratação ajuda a manter a pele macia, evitando ressecamento e danos.\n\n'
              '4. Proteção Solar\nAplique protetor solar todos os dias para evitar danos solares e envelhecimento precoce.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}

class ReconstrucaoDetailPage extends StatelessWidget {
  const ReconstrucaoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hidratação e Reconstrução Capilar'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'Hidratação e Reconstrução',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 221, 156, 232),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'assets/images/hidratacaopele.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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

