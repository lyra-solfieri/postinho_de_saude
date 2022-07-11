import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:share_extend/share_extend.dart';
import 'package:path_provider/path_provider.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class GerarRelatorioPdf extends StatelessWidget {
  const GerarRelatorioPdf({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Relátorio da consulta em pdf"),
      ),
      body: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name;
  String lastName;
  String year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nome'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Sobrenome'),
            onChanged: (val) {
              setState(() {
                lastName = val;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Idade'),
            onChanged: (val) {
              setState(() {
                year = val;
              });
            },
          ),
          RaisedButton(
            onPressed: () {
              _creatPdf(context, name, lastName, year);
            },
            child: Text('Criar PDF'),
          )
        ],
      ),
    ));
  }

  _creatPdf(contex, name, lastName, year) async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);

    pdf.addPage(pdfLib.MultiPage(
        build: (context) => [
              pdfLib.Table.fromTextArray(data: <List<String>>[
                <String>['Nome', 'Sobrenome', 'Idade'],
                [name, lastName, year]
              ])
            ]));

    final String dir = (await getApplicationDocumentsDirectory()).path;

    final String path = '$dir/pdfExample.pdf';
    final File file = File(path);
    file.writeAsBytesSync(await pdf.save());

    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ViewPdf(
              path,
            )));
  }
}

class ViewPdf extends StatefulWidget {
  ViewPdf(this.path);

  final String path;

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(widget.path);
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Relatório de Consulta'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    ShareExtend.share(widget.path, "file",
                        sharePanelTitle: "Enviar PDF", subject: "example-pdf");
                  }),
            )
          ],
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PDFViewer(document: _doc));
  }
}
