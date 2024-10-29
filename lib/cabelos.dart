import 'package:flutter/material.dart';

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
    HomePage(),
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
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
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
                'Sessão: Cabelos',
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
                      'assets/images/curvatura.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Cronograma Capilar: ',
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
                    MaterialPageRoute(builder: (context) => DetailPage(title: 'Hidratação')),
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
                            'assets/images/hidratacao.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'A Hidratação é a etapa fundamental para repor a água perdida pelos fios.',
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
                          height: 120,
                          child: Image.asset(
                            'assets/images/reconstrucao.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'A Reconstrução capilar é a etapa que repõe a massa capilar perdida.',
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
        title: Text('Curvatura'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Entenda seu tipo de curvatura capilar',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 221, 156, 232),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'assets/images/curvatura.jpg',
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
              'Objetivo: A hidratação tem como foco repor a umidade e os níveis de água nos fios, deixando-os macios, brilhantes e maleáveis.\n\n\n'

'Importância:\n'
'Mantém os cabelos saudáveis e com brilho.'
'Ajuda a evitar o ressecamento e a quebra.'
'Melhora a elasticidade dos fios.'

'\n\nComo Fazer:\n'
'Escolha do Produto: Use máscaras de hidratação que contenham ingredientes como aloe vera, glicerina, pantenol, e extratos de frutas.'
'Frequência: Pode ser feita uma ou duas vezes por semana, dependendo do tipo de cabelo e das necessidades específicas.'

'\n\nAplicação:\n'
'Lave o cabelo com shampoo e enxágue bem.'
'Aplique a máscara nos cabelos ainda úmidos, distribuindo uniformemente do comprimento às pontas.'
'Deixe agir conforme as instruções do produto (geralmente de 15 a 30 minutos).'

'\n\n\nEnxágue bem e finalize como preferir (condicionador, leave-in, etc.).',
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
        title: Text('Reconstrução'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Objetivo: A reconstrução tem como objetivo restaurar a estrutura dos fios, especialmente após danos causados por químicas, calor, ou processos mecânicos.\n\n\n'

'Importância:\n'
'Reforça a fibra capilar, ajudando a prevenir a quebra.'
'Restaura a força e a integridade dos fios danificados.'
'É essencial para cabelos quimicamente tratados (como alisamentos, tinturas, etc.).'

'\n\nComo Fazer:\n'
'Escolha do Produto: Utilize máscaras reconstrutoras que contenham proteínas como queratina, colágeno, ou aminoácidos.'
'Frequência: Deve ser feita a cada 15 dias ou uma vez por mês, dependendo do nível de dano do cabelo.'

'\n\nAplicação:\n'
'Lave o cabelo com shampoo e enxágue.'
'Aplique a máscara reconstrutora nos fios úmidos, concentrando-se nas áreas mais danificadas.'
'Deixe agir conforme as instruções do produto (normalmente entre 20 a 40 minutos).'

'\n\n\nEnxágue bem e finalize como de costume.',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Página de Perfil'));
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Página de Notificações'));
  }
}