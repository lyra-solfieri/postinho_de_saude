import 'package:flutter/material.dart';

class Agendamento extends StatelessWidget {
  const Agendamento({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento de consultas médicas'),
      ),
    );
  }
}
