import 'package:app_saude/models/paciente.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({Key key}) : super(key: key);

  // controles dos campos de textos
  final _nomeForm = TextEditingController();
  final _cpfForm = TextEditingController();
  final _enderecoForm = TextEditingController();
  final _emailForm = TextEditingController();
  final _dataNascimentoForm = TextEditingController();
  final _senhaForm = TextEditingController();
  final _confirmaSenha = TextEditingController();
  final _cartaoSUS = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // conexão com o banco
  final _auth = FirebaseAuth.instance;
  final CollectionReference _pacientes =
      FirebaseFirestore.instance.collection('pacientes');

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
        key: _formKey,
        child: ListView(
          children: <Widget>[
            nomeForm(),
            cpfForm(),
            emailForm(),
            enderecoForm(),
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
            validator: (valor) {
              RegExp regex = RegExp(r'^.{5,}$');
              if (valor.isEmpty) {
                return 'Digite o nome completo';
              }
              if (!regex.hasMatch(valor)) {
                return 'Nome tem  que ter mais de 5 caracteres';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nome completo",
                labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                hintText: "Informe o nome")));
  }

  Container enderecoForm() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: _enderecoForm,
        validator: (valor) {
          if (valor.isEmpty) {
            return 'Digite o endereço';
          }
          return null;
        },
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Endereço (rua,número e bairro)",
          hintText: "Ex: Rua afrânio,233,cohab 2",
          labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
    );
  }

  Container emailForm() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: _emailForm,
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
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Digite seu email",
          hintText: "Informe o email",
          labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
    );
  }

  Container senhaForm() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _senhaForm,
          validator: (valor) {
            var senhaRegex = RegExp(r'^.{6,}$');
            if (valor.isEmpty) {
              return 'Digite a senha';
            }
            if (!senhaRegex.hasMatch(valor)) {
              return 'Digite no mínimo 6 caracteres';
            }
            return null;
          },
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
          controller: _confirmaSenha,
          validator: (valor) {
            var senhaRegex = RegExp(r'^.{6,}$');

            if (_confirmaSenha.text == _senhaForm.text) {
              if (!senhaRegex.hasMatch(valor)) {
                return 'Digite no mínimo 6 caracteres';
              }
            }
            return null;
          },
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
          validator: (valor) {
            if (CPFValidator.isValid(_cpfForm.text)) {
              _cpfForm.text = valor;
            }
            if (valor.isEmpty) {
              return 'Digite o cpf';
            }
            return null;
          },
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
          validator: (valor) {
            if (valor.isEmpty) {
              return 'Digite a data de nascimento';
            }

            return null;
          },
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
          validator: (valor) {
            if (valor.isEmpty) {
              return 'Digite o número';
            }
            return null;
          },
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

  //enviando os dados dos campos para o firestore
  postToFirestore() async {
    User user = _auth.currentUser;
    Paciente pacientModel = Paciente();

    /* pacientModel.id = user.uid as int;
    pacientModel.email = user.email;
    pacientModel.nome = _nomeForm.text;
    pacientModel.cpf = _cpfForm.text;
    pacientModel.cartaoSus = _cartaoSUS.text;
    pacientModel.endereco = _enderecoForm.text;
    pacientModel.dataNascimento = _dataNascimentoForm.text;

    await _pacientes.doc(user.uid).set(pacientModel.toMap());
    Fluttertoast.showToast(msg: 'conta criada com sucesso!');*/

    await _pacientes.add({
      'nome': _nomeForm.text,
      'senha': _senhaForm.text,
      'cpf': _cpfForm.text,
      'email': _emailForm.text,
      'endereco': _enderecoForm.text,
      'cartaoSus': _cartaoSUS.text,
      'dataNascimento': _dataNascimentoForm.text,
    });
  }

// Função para o botão de submeter os dados dos novos pacientes
  _cadastroLogin(BuildContext context, String email, String senha) async {
    if (_formKey.currentState.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: senha)
          .then((value) => {
                postToFirestore(),
                Navigator.pushNamed(context, '/'),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }

  Container cadastroButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(55),
      child: ElevatedButton(
        onPressed: () {
          _cadastroLogin(context, _emailForm.text, _senhaForm.text);
          print("Cadastrar");
        },
        child: Text('Cadastrar-se'),
      ),
    );
  }
}
