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
              acessarMedicamentos(),
              Center(
                child: agendarConsulta(),
              ),
              Center(
                child: relatorioPostinho(),
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
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
          side: BorderSide(color: Colors.white, width: 1),
          elevation: 20,
          textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          minimumSize: Size(150, 50),
        ),
      ),
    );
  }

  Container acessarMedicamentos() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/consultar_medicamentos');
        },
        child: Text(
          "Ver medicamentos",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
          side: BorderSide(color: Colors.white, width: 1),
          elevation: 20,
          textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          minimumSize: Size(150, 50),
          shadowColor: Colors.teal,
        ),
      ),
    );
  }

  Container relatorioPostinho() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/relatorio_postinho');
        },
        child: Text(
          "Relatório Consulta",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.blue,
            onSurface: Colors.grey,
            side: BorderSide(color: Colors.white, width: 1),
            elevation: 20,
            textStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            minimumSize: Size(150, 50),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120)),
      ),
    );
  }
}
