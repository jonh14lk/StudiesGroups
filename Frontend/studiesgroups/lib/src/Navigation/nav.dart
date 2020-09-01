import 'package:flutter/material.dart';
import '../screens/allposts.dart';
import '../screens/createpost.dart';
import '../screens/deletepost.dart';
import '../screens/updatepost.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Nav(),
    );
  }
}

class Nav extends StatefulWidget {
  @override
  NavState createState() => NavState();
}

class NavState extends State<Nav> {
  int _currentIndex = 0;

  final tabs = [
    Home(),
    Add(),
    Delete(),
    Update(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF2d3447),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.teal,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              title: Text("Todos os Posts"),
              icon: Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              title: Text("Criar Post"),
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              title: Text("Apagar Post"),
              icon: Icon(Icons.delete),
            ),
            BottomNavigationBarItem(
              title: Text("Editar Post"),
              icon: Icon(Icons.mode_edit),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
