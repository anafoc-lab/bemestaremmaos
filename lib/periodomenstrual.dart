import 'package:flutter/material.dart';
import 'perfil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Periodomenstrual(),
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
      title: 'Bem estar em Mãos - Período Menstrual',
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 241, 241, 1),
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

class Periodomenstrual extends StatelessWidget {
  final List<String> itemNames = [
    'Cabelos',
    'Beleza',
    'Período Menstrual',
    'Saúde',
    'Unhas',
    'Compromissos',
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
              Text(
                'Sessão: Período menstrual',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 221, 156, 232),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: List.generate(itemNames.length, (index) {
                  return GestureDetector(
                    onTap: () {
                     
                    },
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 221, 156, 232),
                            ),
                            child: Image.asset(
                              'assets/images/item$index.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          itemNames[index],
                          style: TextStyle(
                            color: Color.fromARGB(255, 221, 156, 232),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
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
                      'assets/images/hormoniosdociclo.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Hormônios do Ciclo: ',
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
                    MaterialPageRoute(builder: (context) => DetailPage(title: 'Entenda as fases')),
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
                        child: Container(
                          width: 100,
                          height: 120,
                          child: Image.asset(
                            'assets/images/fases.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Essa é uma jornada única para cada mulher, especialmente para aquelas...',
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
                        child: Container(
                          width: 100,
                          height: 140,
                          child: Image.asset(
                            'assets/images/colica.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Alguns truques para acabar com as cólicas menstruais rápido são ...',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hormônios do Ciclo'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Hormônios do Ciclo',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 221, 156, 232),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'assets/images/hormoniosdociclo.jpg',
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

  DetailPage({required this.title});

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
              'Menstrual: Início do ciclo; o revestimento do útero é expelido.'
'\n\nFolicular: Desenvolvimento dos folículos e preparação do corpo para a ovulação.'
'\n\nOvulação: Liberação do óvulo; fase mais fértil.'
'\n\nLútea: Preparação do útero para uma possível gravidez; se não houver fecundação, o ciclo se repete.'
'Compreender essas fases pode ajudar a monitorar o ciclo menstrual, identificar possíveis irregularidades e até mesmo alinhar o autocuidado e as atividades diárias com as mudanças hormonais.',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class ReconstrucaoDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alívio de cólica'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Aliviar as cólicas menstruais é possível com várias práticas simples e eficazes. Aqui estão algumas dicas que podem ajudar a reduzir o desconforto:\n\n\n'

'1. Aplicação de Calor'
'Bolsa Térmica: Colocar uma bolsa de água quente ou almofada térmica sobre o abdômen ou região lombar ajuda a relaxar os músculos uterinos e reduzir as contrações que causam a dor.'
'Banho Quente: Tomar um banho morno também pode proporcionar alívio, relaxando os músculos do corpo.'
'\n\n2. Chás e Infusões Naturais'
'Chá de Camomila: A camomila tem propriedades anti-inflamatórias e calmantes que ajudam a aliviar as cólicas.',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}



class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Página de Notificações'));
  }
}
