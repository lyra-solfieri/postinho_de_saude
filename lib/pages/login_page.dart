import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  final _formKey = GlobalKey<FormState>();

  // Firebase
  final _auth = FirebaseAuth.instance;

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
          SizedBox(height: 30),
          Text(
            'Postinho Garanhuns',
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          textFormLogin(),
          textFormFieldSenha(),
          loginButton(context),
          cadastroButton(context),
        ],
      ),
    );
  }

// campo de email com validação
  Container textFormLogin() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _tLogin,
          validator: (value) {
            if (value.isEmpty) {
              return ("Por favor digite seu email");
            }
            // reg expression: para validação do email
            if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
              return "Digite um email válido";
            }

            return null;
          },
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black),
          onSaved: (newValue) => {_tLogin.text = newValue},
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
              labelText: "Email",
              labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
              hintText: "Informe o email"),
        ));
  }

// campo de senha com validação
  Container textFormFieldSenha() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _tSenha,
          validator: (value) {
            RegExp regex = RegExp(r'^.{6,}$');
            if (value.isEmpty) {
              return "Digite a senha";
            }
            if (!regex.hasMatch(value)) {
              return "Digite um senha válida com no mínimo 6 caracteres";
            }
            return null;
          },
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(color: Colors.black),
          onSaved: (newValue) => {_tSenha.text = newValue},
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.password),
            border: OutlineInputBorder(),
            labelText: "Senha",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe a senha",
          ),
        ));
  }

// função de ação do botão após preencher os campos email e senha
  _onClickLogin(BuildContext context, String email, String senha) async {
    if (_formKey.currentState.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: senha)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'Logado com sucesso'),
                Navigator.pushNamed(context, '/menu'),
              })
          .catchError((onError) {
        Fluttertoast.showToast(msg: onError).toString();
      });
    }
  }

  Container loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          _onClickLogin(context, _tLogin.text, _tSenha.text);
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
