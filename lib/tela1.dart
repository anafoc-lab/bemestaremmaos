import 'compromissos.dart';
import 'periodomenstrual.dart';
import 'saude.dart';
import 'unhas.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'perfil.dart';
import 'cabelos.dart';
import 'beleza.dart';

void main() {
  runApp(MaterialApp(
    
    title: 'Bem Estar em Mãos',
    home: Tela1(),
  ));
}

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  _Tela1State createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
   ProfilePage(email: 'anaflavia@gmail.com',),
    NotificationsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: _widgetOptions[_selectedIndex],
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

HomePage({super.key});

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
