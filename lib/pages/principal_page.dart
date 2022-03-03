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
                child: Text(
                  "Olá paciente",
                ),
              ),
              marcarConsulta()
            ],
          ),
        ));
  }

  Container marcarConsulta() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => {},
        child: Text('Agendar Consulta Médica'),
      ),
    );
  }
}
