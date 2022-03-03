import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({Key key}) : super(key: key);

  final _nomeForm = TextEditingController();
  final _cpfForm = TextEditingController();
  final _dataNascimentoForm = TextEditingController();
  final _senhaForm = TextEditingController();
  final _cartaoSUS = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastre-se Gratuitamente"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Form(
        child: ListView(
      children: <Widget>[
        nomeForm(),
        cpfForm(),
        dataNascimentoForm(),
        senhaForm(),
        confirmacaoSenha(),
        cartaoSusForm(),
        cadastroButton(context)
      ],
    ));
  }

  Container nomeForm() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
            controller: _nomeForm,
            validator: validateNome,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nome completo",
                labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                hintText: "Informe o nome")));
  }

  Container senhaForm() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _senhaForm,
          validator: validateSenha,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Senha",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe a senha",
          ),
        ));
  }

  Container confirmacaoSenha() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _senhaForm,
          validator: validateConfirmacaoSenha,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Confirmacao de Senha",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe a senha",
          ),
        ));
  }

  Container cpfForm() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _cpfForm,
          validator: validateCpf,
          obscureText: false,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Cpf",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe o cpf",
          ),
        ));
  }

  Container dataNascimentoForm() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _dataNascimentoForm,
          validator: validateConfirmacaoSenha,
          obscureText: false,
          keyboardType: TextInputType.datetime,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Data de nascimento",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe a data",
          ),
        ));
  }

  Container cartaoSusForm() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _cartaoSUS,
          validator: validateConfirmacaoSenha,
          obscureText: false,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "CartaoSus",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe o cartao",
          ),
        ));
  }

  Container cadastroButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(55),
      child: ElevatedButton(
        onPressed: () {
          print("Cadastrar");
        },
        child: Text('Cadastrar-se'),
      ),
    );
  }

  String validateNome(String text) {
    if (text.isEmpty) {
      return "Campo Obrigatório";
    }

    return null;
  }

  String validateCpf(String text) {
    if (text.isEmpty) {
      return "Campo Obrigatório";
    }

    return null;
  }

  String validateDataNascimentoForm(String text) {
    if (text.isEmpty) {
      return "Campo Obrigatório";
    }

    return null;
  }

  String validateSenha(String text) {
    if (text.isEmpty) {
      return "Campo Obrigatório";
    }

    return null;
  }

  String validateConfirmacaoSenha(String text) {
    if (text.isEmpty) {
      return "Campo Obrigatório";
    }

    return null;
  }

  String validateCartaoSUS(String text) {
    if (text.isEmpty) {
      return "Campo Obrigatório";
    }

    return null;
  }
}
