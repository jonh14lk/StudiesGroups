import 'package:flutter/material.dart';

class FailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: Center(
        child: Text(
          'Não foi possível conectar-se, tente novamente',
          style: TextStyle(
            color: Colors.teal,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }
}
