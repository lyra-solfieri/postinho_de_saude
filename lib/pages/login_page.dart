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
          loginButton(context),
          cadastroButton(context),
        ],
      ),
    );
  }

  // verifica se o campo login tem caractere digitado
  String validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }

    return null;
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

  // verifica se o campo senha tem caracteres
  String validateSenha(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    if (text.length < 7) {
      return "A senha deve possui mais de 7 caracteres";
    }
    return null;
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
    if (!_formKey.currentState.validate()) {
      return Navigator.pushNamed(context, '/menu');
    } else {
      return throw new Exception('Usuário inválido');
    }
  }

  Container loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          try {
            _onClickLogin(context);
          } catch (e) {
            print('$e');
          }
        },
        style: style,
        child: Text('Entrar'),
      ),
    );
  }

  Container cadastroButton(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Ainda não tem cadastro ?'),
          TextButton(
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
