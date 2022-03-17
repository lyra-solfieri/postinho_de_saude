import 'package:app_saude/pages/cadastro_page.dart';
import 'package:app_saude/pages/login_page.dart';
import 'package:app_saude/pages/principal_page.dart';
import 'package:app_saude/pages/agendar_consulta.dart';
import 'package:flutter/material.dart';

main(List<String> args) => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postinho de saude App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(),
        '/menu': (context) => HomePage(),
        '/agendar_consulta': (context) => Agendamento(),
      },
    );
  }
}
