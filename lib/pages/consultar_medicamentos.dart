import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConsultaMedicamentos extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ConsultaMedicamentos> {
  void initState() {
    super.initState();
    readData();
  }

  bool isLoading = true;
  List<String> list = [];

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
        list.add(medData["medicamento"]);
      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicamentos"),
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        list[index],
                        style: TextStyle(color: Colors.green),
                      ),
                    ));
              }),
    );
  }
}
