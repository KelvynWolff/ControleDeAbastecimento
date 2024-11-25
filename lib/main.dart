import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/config/firebase_options.dart';
import 'views/config/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ControleDeAbastecimentoApp());
}

class ControleDeAbastecimentoApp extends StatelessWidget {
  const ControleDeAbastecimentoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Abastecimento',
      theme: ThemeData(
        primaryColor: const Color(0xFF007F3F),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      initialRoute: '/login', // Configurado para iniciar na tela de login
      routes: AppRoutes.obterRotas(),
      debugShowCheckedModeBanner: false,
    );
  }
}
