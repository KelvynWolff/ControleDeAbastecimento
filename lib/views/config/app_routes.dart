import 'package:flutter/material.dart';
import '../autenticacao/login.dart';
import '../autenticacao/cadastro.dart';
import '../autenticacao/reset_senha.dart';
import '../home.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> obterRotas() {
    return {
      '/login': (context) => const TelaLogin(),
      '/cadastro': (context) => const TelaCadastro(),
      '/reset_senha': (context) => const TelaResetSenha(),
      '/': (context) => const TelaInicial(),
    };
  }
}
