// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
/*
import 'package:app_saude/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_saude/main.dart';
*/

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_saude/pages/login_page.dart';

void main() {
  test("Teste para campo de email vazio", () {
    var resultado = LoginPage().validateLogin("");
    expect(resultado, "Informe o login");
  });

  test("Verifica se a senha está vazia", () {
    var resultado = LoginPage().validateSenha("");
    expect(resultado, "Informe a senha");
  });

  test("verifica o tamanho da senha", () {
    var resultado = LoginPage().validateSenha("text");
    expect(resultado, "A senha deve possui mais de 7 caracteres");
  });
}

/* 
void main(List<String> args) {
  testWidgets("test description", (WidgetTester tester) async {
    await tester.pumpWidget(LoginPage());
    //var testform = find.byType(textFormLogin);
    //expect(testform, findsOneWidget);
  });
}*/
