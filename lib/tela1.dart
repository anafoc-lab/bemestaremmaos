import 'package:bemestaremmaos/periodomenstrual.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'perfil.dart';
import 'cabelos.dart';  // Supondo que esta é uma página já existente
import 'beleza.dart';   // Substitua pelos imports das suas páginas
import 'periodomenstrual.dart';
import 'saude.dart';
import 'unhas.dart';
import 'compromissos.dart';

void main() {
  runApp(Tela1());
}

class Tela1 extends StatefulWidget {
  @override
  _Tela1State createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
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
      title: 'Bem estar em Mãos',
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
          selectedItemColor: Color.fromARGB(255, 221, 156, 232),
          unselectedItemColor: const Color.fromARGB(255, 221, 156, 232),
          backgroundColor: Colors.grey[800],
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
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: List.generate(itemNames.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      
                      if (index == 0) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Cabelos()));
                      } else if (index == 1) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Beleza()));
                      } else if (index == 2) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Periodomenstrual()));
                      } else if (index == 3) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Saude()));
                      } else if (index == 4) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Unhas()));
                      } else if (index == 5) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Compromissos()));
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 210, 85, 195),
                          ),
                          child: ClipOval(
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
              TableCalendar(
                firstDay: DateTime.utc(2022, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.month,
                onDaySelected: (selectedDay, focusedDay) {},
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
