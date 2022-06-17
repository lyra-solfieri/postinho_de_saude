import 'package:flutter/material.dart';

class InicialPage extends StatefulWidget {
  //const InicialPage({Key key}) : super(key: key);
  @override
  InicialPageState createState() => InicialPageState();
}

class InicialPageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Seja bem vindo(a)!'),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: irParaLogin(context),
            ),
          ],
        ),
      ),
    );
  }
}

// Botão de acceso a Página de Login
Container irParaLogin(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(50),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/loading');
      },
      child: Text(
        'Acessar área paciente',
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}
