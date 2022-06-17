import 'package:flutter/material.dart';
import 'package:app_saude/models/medicamentos.dart';

class ConsultaMedicamentos extends StatelessWidget {
  const ConsultaMedicamentos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Medicamentos"),
      ),
    );
  }
}
