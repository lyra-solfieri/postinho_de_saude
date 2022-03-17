import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pagina Principal"),
        ),
        body: Container(
          child: Column(
            children: [
              Center(
                child: agendarConsulta(),
              ),
            ],
          ),
        ));
  }

  Container agendarConsulta() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/agendar_consulta');
        },
        child: Text(
          'Agendar Consulta Médica',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
