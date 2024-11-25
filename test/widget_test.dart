import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:controle_de_abastecimento/main.dart';

void main() {
  testWidgets('Testa a inicialização do aplicativo',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ControleDeAbastecimentoApp());

    expect(find.text('Controle de Abastecimento'), findsOneWidget);
  });
}
