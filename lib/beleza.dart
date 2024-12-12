import 'package:flutter/material.dart';
import 'perfil.dart';
import 'tela1.dart';



void main() {
  runApp(Beleza());
}

class Beleza extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Beleza> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Beleza(),
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
      title: 'Bem estar em Mãos - Beleza',
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

class Beleza1 extends StatelessWidget {
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
                'Sessão: Beleza',
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
                        child: Container(
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
                        child: Container(
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
              'Aqui estão algumas dicas essenciais de skincare (cuidados com a pele) para manter a pele saudável, limpa e com aspecto rejuvenescido:\n\n\n'

'1. Conheça Seu Tipo de Pele'
'Antes de começar qualquer rotina de skincare, é fundamental saber se sua pele é oleosa, seca, mista ou sensível. Isso permitirá que você escolha os produtos certos e evite reações adversas.'

'\n\n2. Limpeza Diária'
'Manhã e Noite: Lave o rosto duas vezes por dia com um sabonete facial adequado ao seu tipo de pele. A limpeza remove impurezas, resíduos de maquiagem e o excesso de oleosidade.'
'Evite Água Quente: Prefira água morna ou fria para evitar o ressecamento.'

'\n\n3. Hidratação'
'Todo Tipo de Pele Precisa de Hidratação: Mesmo peles oleosas precisam de um bom hidratante, de preferência com uma fórmula leve e não-comedogênica (que não obstrua os poros).'
'Creme Hidratante: Escolha hidratantes ricos em ingredientes como ácido hialurônico, glicerina ou ceramidas para manter a pele hidratada e protegida.'

'\n\n4. Proteção Solar Diária'
'Filtro Solar: Use protetor solar com um FPS de pelo menos 30 todos os dias, mesmo em dias nublados ou dentro de casa. A exposição aos raios UV pode causar envelhecimento precoce, manchas escuras e câncer de pele.'
'Reaplique: Reaplique o protetor a cada 2-3 horas se estiver exposta ao sol.'

'\n\n5. Esfoliação'
'Uma a Duas Vezes por Semana: A esfoliação ajuda a remover células mortas, desobstruir poros e melhorar a textura da pele. Use esfoliantes físicos (com grânulos) ou químicos (com ácidos como o ácido glicólico ou salicílico) com moderação.'
'Atenção para Peles Sensíveis: Se sua pele for sensível, use esfoliantes mais suaves e evite esfoliar com muita frequência.'
'\n\n6. Tratamentos Específicos'
'Séruns: Inclua séruns com ingredientes ativos para tratar problemas específicos, como:'
'Vitamina C: Antioxidante que ilumina e combate manchas escuras.'
'Ácido Hialurônico: Potente hidratante que retém a umidade da pele.'
'Niacinamida: Reduz a oleosidade e melhora a aparência dos poros.'
'Retinol: Um poderoso anti-idade que estimula a renovação celular e combate rugas e linhas finas (melhor usado à noite).'
'\n\n7. Cuidados com a Área dos Olhos'
'Use Produtos Específicos: A pele ao redor dos olhos é mais fina e delicada, então use cremes específicos para essa área, contendo ingredientes como cafeína, ácido hialurônico ou vitamina C.'

'\n\n8. Rotina Noturna'
'Remova a Maquiagem: Nunca durma com maquiagem, pois pode obstruir os poros e causar acne.'
'Séruns e Cremes Noturnos: À noite, aproveite para usar tratamentos mais intensos, como o retinol ou hidratantes mais pesados que reparam e regeneram a pele enquanto você dorme.'

'\n\n9. Beber Água'
'Manter-se hidratada é essencial para uma pele saudável. Beber água ajuda a manter a elasticidade e a umidade da pele de dentro para fora.'
'\n\n10. Alimentação Balanceada'
'Dieta Rica em Antioxidantes: Consuma alimentos ricos em antioxidantes (frutas, vegetais) que combatem os radicais livres e promovem uma pele mais saudável e jovem.'
'Evite Excesso de Açúcar: O excesso de açúcar pode contribuir para o envelhecimento precoce e a piora da acne.'

'\n\n11. Controle do Estresse e Qualidade do Sono'
'Durma Bem: O sono reparador é essencial para a renovação celular da pele. Tente dormir de 7 a 9 horas por noite.'
'Gerencie o Estresse: O estresse pode afetar a saúde da pele, causando acne, inflamações ou exacerbação de doenças como psoríase e rosácea.'

'\n\n12. Consistência é a Chave'
'Não adianta fazer skincare esporadicamente. Para ver resultados, é necessário ser consistente com sua rotina diária.'

'\n\nRotina Básica de Skincare'
'\n\nManhã:'

'Limpeza'
'Sérum (opcional)'
'Hidratante'
'Protetor Solar'

'\n\nNoite:'
'Limpeza'
'Sérum de tratamento (ácido hialurônico, vitamina C, etc.)'
'Creme noturno ou hidratante mais rico'

'\n\nEssas dicas podem ser ajustadas conforme as necessidades específicas da sua pele, criando uma rotina eficaz para mantê-la saudável e bonita.'

,
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
        title: Text('Hidratação'),
        backgroundColor: Color.fromARGB(255, 221, 156, 232),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'A hidratação da pele é fundamental para mantê-la saudável, macia e com aspecto jovem. Quando a pele está devidamente hidratada, ela mantém a elasticidade, protege-se contra irritações e retarda o envelhecimento. Aqui estão algumas dicas e práticas eficazes para garantir uma boa hidratação da pele:\n\n\n'

'\n\n1. Beber Água Suficiente'
'Manter o corpo hidratado de dentro para fora é crucial. Beber cerca de 2 litros de água por dia ajuda a manter a pele saudável e a repor a umidade perdida ao longo do dia.'

'\n\n2. Escolha de Hidratantes Adequados'
'Peles Secas: Prefira hidratantes mais ricos e densos, como aqueles à base de manteigas (karité, cacau) e óleos (jojoba, amêndoas, coco).'
'Peles Oleosas/Mistas: Use hidratantes leves, não-comedogênicos, como géis ou loções à base de água, para hidratar sem aumentar a oleosidade.'
'Peles Sensíveis: Opte por hidratantes com ingredientes calmantes como aloe vera, camomila, e sem fragrâncias ou corantes.'

'\n\n3. Uso de Ingredientes Hidratantes Potentes'
'Ácido Hialurônico: Este ingrediente é capaz de reter até 1000 vezes o seu peso em água, sendo ideal para manter a pele hidratada e com aparência saudável.'
'Glicerina e Ureia: São humectantes que atraem a umidade do ambiente para a pele, ajudando a mantê-la hidratada.'
'Ceramidas: Ajudam a restaurar a barreira de proteção da pele, retendo a hidratação e prevenindo a perda de água.'

'\n\n4. Aplicação Correta do Hidratante'
'Imediatamente Após o Banho: A melhor hora para aplicar o hidratante é logo após o banho, quando a pele ainda está levemente úmida. Isso ajuda a selar a umidade na pele.'
'Massageie Suavemente: Aplique o hidratante com movimentos circulares, massageando suavemente até que seja totalmente absorvido.'

'\n\n5. Evitar Banhos Longos e Quentes'
'Banhos quentes e prolongados podem remover a camada natural de oleosidade da pele, causando ressecamento. Prefira banhos rápidos com água morna.'

'\n\n6. Esfoliação Regular'
'A esfoliação remove as células mortas da pele, permitindo que o hidratante penetre melhor. No entanto, esfolie a pele apenas uma ou duas vezes por semana para evitar irritações. Peles sensíveis devem usar esfoliantes mais suaves.'

'\n\n7. Umidificador de Ar'
'Em ambientes secos ou durante o inverno, o ar tende a ser mais seco, o que pode ressecar a pele. Usar um umidificador em casa ajuda a manter a umidade no ar e evita que sua pele se desidrate.'

'\n\n8. Uso de Óleos Corporais'
'Óleo Corporal: Óleos vegetais como o óleo de amêndoas, óleo de coco ou óleo de semente de uva são excelentes para selar a hidratação. Eles podem ser aplicados diretamente sobre a pele após o banho ou misturados com o hidratante.'
'Óleos Faciais: Para o rosto, use óleos específicos, como o óleo de rosa mosqueta (excelente para regeneração) ou óleo de jojoba (semelhante ao sebo natural da pele).'

'\n\n9. Hidratantes Noturnos'
'Durante a noite, a pele entra em um processo de reparação e regeneração. Usar cremes noturnos mais densos e ricos em nutrientes, como manteigas e ácidos graxos, ajuda a potencializar a hidratação.'

'\n\n10. Proteção Solar'
'O sol pode ressecar e danificar a pele, então é essencial usar protetor solar com fator de proteção (FPS) todos os dias, mesmo em ambientes fechados ou nublados. Existem protetores solares com efeito hidratante, ideais para manter a pele protegida e hidratada.'

'\n\n11. Evitar Sabonetes Ressecantes'
'Use sabonetes suaves, sem sulfatos e com pH neutro ou levemente ácido. Sabonetes agressivos podem remover a barreira natural de hidratação da pele, contribuindo para o ressecamento.'

'\n\n12. Alimentação Balanceada'
'Inclua alimentos ricos em ácidos graxos ômega-3 (peixes, sementes de chia, nozes) e antioxidantes (frutas vermelhas, vegetais de folhas verdes), que contribuem para uma pele mais hidratada e com melhor aspecto.'
'\n\n\nManter esses cuidados e práticas ajuda a garantir que a pele fique bem hidratada, saudável e com uma aparência radiante ao longo do tempo.',
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