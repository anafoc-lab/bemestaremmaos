import 'compromissos.dart';
import 'periodomenstrual.dart';
import 'saude.dart';
import 'unhas.dart';
import 'package:flutter/material.dart';
import 'perfil.dart';
import 'cabelos.dart';
import 'beleza.dart';

void main() {
  runApp(saudes());
}

class saudes extends StatefulWidget {
  const saudes({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<saudes> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Saude(),
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
      title: 'Bem Estar em Mãos - Saúde',
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

class Saude extends StatelessWidget {
  final List<String> itemNames = [
    'Cabelos',
    'Beleza',
    'Período Menstrual',
    'Saúde',
    'Unhas',
    'Compromissos',
  ];

 Saude({super.key});

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
                'Sessão: Saúde',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 221, 156, 232),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
  
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
                      'assets/images/atividadefisica.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Saúde e bem estar: ',
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
                    MaterialPageRoute(builder: (context) => DetailPage(title: 'Atividade Física')),
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
                            'assets/images/correr.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'A prática regular de atividade física é capaz de melhorar a circulação ...',
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
                            'assets/images/beberagua.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'A hidratação é a base da saúde, muitas vezes ofuscada pelos ...',
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
        title: Text('Saúde e bem estar'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                'Saúde e bem estar',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 221, 156, 232),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'assets/images/atividadefisica.jpg',
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
              'A atividade física desempenha um papel crucial na saúde e bem-estar das mulheres. Aqui estão algumas das principais razões que destacam sua importância:\n\n\n'

'1 - Saúde Física: A atividade física regular ajuda a manter um peso saudável, reduzindo o risco de doenças crônicas como diabetes tipo 2, doenças cardíacas e hipertensão. Também fortalece os ossos, reduzindo o risco de osteoporose, especialmente após a menopausa.'

'\n\n2 - Saúde Mental: O exercício é conhecido por melhorar a saúde mental. A prática regular libera endorfinas, que podem ajudar a reduzir os sintomas de depressão e ansiedade. Além disso, pode melhorar o sono e aumentar a autoestima.'

'\n\n3 - Regulação do Ciclo Menstrual: Para mulheres que têm irregularidades menstruais, a atividade física pode ajudar a regular o ciclo menstrual e aliviar os sintomas da TPM (tensão pré-menstrual).'

'\n\n4 - Gestão do Estresse: O exercício é uma ótima maneira de aliviar o estresse. Durante a atividade física, o corpo libera hormônios que ajudam a combater o estresse e melhorar o humor.'

'\n\n5 - Saúde Cardiovascular: A atividade física ajuda a melhorar a saúde cardiovascular, aumentando a circulação sanguínea e reduzindo a pressão arterial. Isso é especialmente importante para as mulheres, que têm um risco aumentado de doenças cardíacas após a menopausa.'

'\n\n6 - Aumento da Energia: Embora possa parecer contraditório, a atividade física regular pode aumentar os níveis de energia ao melhorar a eficiência do sistema cardiovascular e muscular.'

'\n\n7 - Socialização e Conexões: Participar de atividades físicas em grupo pode promover a socialização, ajudando as mulheres a se conectarem com outras e a formarem redes de apoio.'

'\n\n8 - Apoio à Gravidez: Exercícios leves e moderados durante a gravidez podem ajudar a controlar o ganho de peso, reduzir o risco de complicações e promover um parto mais saudável.'

'\n\n9 - Envelhecimento Saudável: A atividade física regular está associada a um envelhecimento saudável, ajudando a manter a força muscular, a flexibilidade e a mobilidade.'

'\n\n10 - Empoderamento: Praticar atividade física pode promover um sentimento de empoderamento e autocontrole, incentivando as mulheres a se sentirem mais confiantes em seus corpos e habilidades.'

'\n\n\nIncorporar atividades físicas na rotina diária pode ter um impacto significativo na saúde física e mental das mulheres, contribuindo para uma vida mais saudável e equilibrada.',
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
  const ReconstrucaoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hidrate-se'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Beber água é essencial para a saúde e o bem-estar geral do corpo humano. Aqui estão algumas das principais razões que destacam a importância de manter uma boa hidratação:\n\n\n'

'1 - Manutenção da Função Corporal: A água é crucial para várias funções corporais, incluindo regulação da temperatura, digestão, absorção de nutrientes, e eliminação de resíduos.'

'\n\n2- Saúde da Pele: A hidratação adequada ajuda a manter a pele saudável, elástica e com aparência jovem. A desidratação pode causar ressecamento e promover o envelhecimento precoce.'

'\n\n3 - Apoio ao Sistema Imunológico: Beber água suficiente pode ajudar a fortalecer o sistema imunológico, pois a hidratação adequada contribui para a circulação de linfócitos e outros componentes do sistema imunológico.'

'\n\n4 - Melhoria da Digestão: A água é fundamental para a digestão e absorção de nutrientes. Ela ajuda a dissolver os nutrientes e a facilitar seu transporte pelo corpo.'

'\n\n5 - Aumento de Energia: A desidratação pode levar à fadiga e à falta de energia. Manter-se hidratado pode ajudar a aumentar os níveis de energia e melhorar a performance física.'

'\n\n6 - Controle do Apetite e Peso: Às vezes, a sede é confundida com fome. Beber água regularmente pode ajudar a controlar o apetite e, portanto, contribuir para o gerenciamento do peso.'

'\n\n 7 -Função Cognitiva: A desidratação leve pode afetar negativamente a concentração, o foco e o estado de alerta. Beber água ajuda a manter a função cognitiva adequada.'

'\n\n8 - Regulação da Temperatura Corporal: A água é essencial para a regulação da temperatura do corpo, especialmente durante atividades físicas e em climas quentes, ajudando a prevenir o superaquecimento.'

'\n\n9 - Saúde Renal: A hidratação adequada é vital para a saúde dos rins, pois a água ajuda a eliminar toxinas e resíduos do corpo. A desidratação pode aumentar o risco de cálculos renais.'

'\n\n10 - Melhoria do Desempenho Físico: Durante a prática de atividades físicas, a hidratação é fundamental para o desempenho atlético, ajudando a evitar cãibras, fadiga e outras complicações relacionadas à desidratação.'

'\n\n11 - Apoio à Circulação Sanguínea: A água é um componente essencial do sangue, ajudando a manter a circulação adequada e a transporte de oxigênio e nutrientes para as células.'

'\n\n\nÉ importante lembrar que as necessidades de hidratação podem variar de pessoa para pessoa, dependendo de fatores como idade, nível de atividade física, clima e saúde geral. Uma boa prática é beber água ao longo do dia, mesmo antes de sentir sede, para garantir uma hidratação adequada.',
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
