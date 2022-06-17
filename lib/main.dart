import 'package:app_saude/pages/inicial_page.dart';
import 'package:app_saude/pages/login_page.dart';
import 'package:app_saude/pages/cadastro_page.dart';
import 'package:app_saude/pages/principal_page.dart';
import 'package:app_saude/pages/agendar_consulta.dart';
import 'package:app_saude/pages/localizacao_postinho.dart';
import 'package:app_saude/pages/consultar_medicamentos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_saude/pages/loading_page.dart';

import 'package:flutter/material.dart';

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyABigXKFQ0L6mHAcyW2CuOUdW9a6u6hzQM",
          appId: "emailpasswordauthpostinho",
          messagingSenderId: "messagingSenderId",
          projectId: "1066885982380"));
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postinho de saude App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => InicialPage(),
        '/login_page': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(),
        '/loading': (context) => LoadingPage(),
        '/menu': (context) => HomePage(),
        '/agendar_consulta': (context) => Agendamento(),
        '/localizacao_postinho': (context) => LocalizacaoPostinho(),
        '/consultar_medicamentos': (context) => ConsultaMedicamentos(),
      },
    );
  }
}
