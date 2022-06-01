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
                child: localizacaoPostinho(),
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
      ),
    );
  }

  Container localizacaoPostinho() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/localizacao_postinho');
        },
        child: Text(
          "Localização Postinho",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
