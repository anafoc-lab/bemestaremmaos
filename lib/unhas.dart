import 'package:flutter/material.dart';
import 'perfil.dart';
import 'tela1.dart';

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
    Tela1(),
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
      title: 'Bem estar em Mãos - Unhas',
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

class Unhas extends StatelessWidget {
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
                'Sessão: Unhas',
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
                      'assets/images/formatodeunhas.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Cuidado com as Unhas: ',
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
                            'assets/images/hidratacaounhas.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Aprenda a hidratar suas unhas e cutículas para deixa-las cada vez mais saudáveis',
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
                            'assets/images/unhaslixas.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Aprenda como lixar suas unhas para que quebrem menos, seja mais confortável e muito mais.',
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
        title: Text('Formatos de unhas'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Entenda os formatos de unha',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 221, 156, 232),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'assets/images/formatodeunhas.jpg',
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
              'Dicas para Hidratação das Unhas:\n\n\n'
          
'1 - Use um Hidratante para Unhas: Aplique um creme ou óleo específico para unhas e cutículas diariamente. Produtos com ingredientes como vitamina E, óleo de jojoba ou óleo de amêndoas são excelentes para hidratar.'

'\n\n2 - Beba Água: Manter-se hidratado internamente é essencial para a saúde das unhas. Beber água regularmente ajuda a evitar que as unhas fiquem secas e quebradiças.'

'\n\n3 - Evite Produtos Químicos: Reduza o uso de produtos químicos agressivos, como removedores de esmalte à base de acetona, pois podem ressecar as unhas. Opte por removedores sem acetona.'

'\n\n4 - Use Luvas: Ao realizar tarefas domésticas, como lavar louças ou limpar, use luvas para proteger as unhas da exposição a produtos químicos e água quente.'

'\n\n5 - Alimente-se Bem: Uma dieta rica em vitaminas e minerais, especialmente biotina, zinco e vitamina B, pode ajudar a fortalecer as unhas. Inclua alimentos como nozes, ovos, peixes e vegetais verdes na sua alimentação.'

'\n\n6 - Evite Roer as Unhas: Este hábito pode danificar a estrutura das unhas e das cutículas. Procure alternativas para lidar com o estresse ou a ansiedade.'

'\n\n7 - Faça Banhos de Unhas: Mergulhe as unhas em uma mistura de água morna e azeite de oliva ou óleo de rícino por cerca de 10-15 minutos para uma hidratação extra.'

'\n\n8 - Esfoliação das Cutículas: Use um esfoliante suave para remover a pele morta ao redor das unhas, o que pode ajudar na absorção dos hidratantes.'

'\n\nIncorporar esses cuidados na sua rotina pode ajudar a manter as unhas saudáveis e hidratadas!',
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
        title: Text('Lixamento'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Dicas para Lixamento de Unhas:\n\n\n'
'1- Escolha o Lixa Certa:'
' Use uma lixa de grão fino (240) para suavizar as bordas e uma lixa de grão mais grosso (180) para moldar as unhas.'
'Evite lixas de papel muito ásperas, pois podem danificar a unha.'

'\n\n2- Lixe em Uma Direção:'
'Sempre lixe as unhas em uma direção, evitando movimentos de vai-e-vem. Isso ajuda a prevenir a quebra e o lascamento das unhas.'

'\n\n3 - Mantenha as Unhas Secas:'
'Lixe as unhas quando estiverem secas, pois unhas molhadas são mais suscetíveis a danos.'

'\n\n4 - Evite Lixar em Excesso:'
'Não lixe as unhas por muito tempo, pois isso pode deixá-las finas e fracas. Lixe apenas o suficiente para suavizar as bordas e moldar.'

'\n\n5 - Lixe as Bordas:'
'Concentre-se nas bordas laterais e na ponta das unhas, evitando lixar a superfície superior, a menos que precise remover um esmalte ou tratamento.'

'\n\n6 - Cuide das Cutículas:'
'Após lixar, aplique um hidratante nas cutículas para mantê-las saudáveis e hidratadas.'

'\n\n7 - Desinfete a Lixa:'
'Mantenha a higiene das suas lixas desinfetando-as regularmente para evitar a propagação de bactérias e fungos.'

'\n\n8 - Evite Lixar as Unhas Postiças:'
'Se você estiver usando unhas postiças, evite lixar a parte natural da unha, pois isso pode danificá-la.'

'\n\n9 - Lixe Após o Banho:'
'O ideal é lixar as unhas após o banho, quando elas estão mais macias e mais fáceis de moldar.'

'\n\n10 - Use um Finalizador:'

'\n\n\nIncorporando essas dicas, você pode manter suas unhas bem cuidadas, com um formato bonito e saudável!',
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
