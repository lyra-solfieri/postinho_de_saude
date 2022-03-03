import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postinho App"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  String validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }

    return null;
  }

  String validateSenha(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    if (text.length < 7) {
      return "A senha deve possui mais de 7 caracteres";
    }
    return null;
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Text(
            'Postinho Garanhuns',
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          textFormLogin(),
          textFormFieldSenha(),
          containerButton(context),
          cadastroForm(context),
        ],
      ),
    );
  }

  Container textFormLogin() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
            controller: _tLogin,
            validator: validateLogin,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "CPF",
                labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                hintText: "Informe seu CPF")));
  }

  Container textFormFieldSenha() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _tSenha,
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

// Fazer validação do cpf e senha com os dados cadastrados
  _onClickLogin(BuildContext context) async {
    Navigator.pushNamed(context, '/menu');

    if (!_formKey.currentState.validate()) {
      return;
    }
  }

  Container containerButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          _onClickLogin(context);
        },
        style: style,
        child: Text('Entrar'),
      ),
    );
  }

  Container cadastroForm(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Ainda Não tem cadastro ?'),
          FlatButton(
            textColor: Colors.blue,
            child: Text(
              'Cadastrar',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/cadastro');
            },
          ),
        ],
      ),
    );
  }
}
