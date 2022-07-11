import 'package:app_saude/models/medicamentos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConsultaMedicamentos extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ConsultaMedicamentos> {
  bool isLoading = true;
  Future<MedicamentosModel> futureMedicamento;
  var listaMedicamentos = [];

  final response = http.get(Uri.parse(
      'https://emailpasswordauthpostinho-default-rtdb.firebaseio.com/medicamentos' +
          '.json'));

  void initState() {
    super.initState();
    futureMedicamento = fetchMedicamento();
  }

  Future<MedicamentosModel> fetchMedicamento() async {
    final response = await http.get(Uri.parse(
        'https://emailpasswordauthpostinho-default-rtdb.firebaseio.com/medicamentos' +
            '.json'));

    if (response.statusCode == 200) {
      print(response.body);
      listaMedicamentos.add(response.body.toString());
      Text(response.body.toString());
      return MedicamentosModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }

/*
  Future<void> readData() async {
    var url =
        "https://emailpasswordauthpostinho-default-rtdb.firebaseio.com/medicamentos" +
            "data.json";

    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((medId, medData) {
        medicamentos.add(medData["medicamento"]);
      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamentos'),
      ),
      body: Center(
        child: FutureBuilder<MedicamentosModel>(
          future: futureMedicamento,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(listaMedicamentos[0]);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
