import 'package:flutter/material.dart';
import '../../controllers/autenticacao_controller.dart';

class TelaResetSenha extends StatefulWidget {
  const TelaResetSenha({Key? key}) : super(key: key);

  @override
  State<TelaResetSenha> createState() => _TelaResetSenhaState();
}

class _TelaResetSenhaState extends State<TelaResetSenha> {
  final TextEditingController emailController = TextEditingController();
  final AutenticacaoController _authController = AutenticacaoController();

  void enviarEmailRecuperacao() async {
    try {
      await _authController.enviarEmailRecuperacao(emailController.text);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('E-mail de recuperação enviado!')),
        );
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
        backgroundColor: const Color(0xFF007F3F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: enviarEmailRecuperacao,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007F3F),
              ),
              child: const Text('Recuperar Senha'),
            ),
          ],
        ),
      ),
    );
  }
}
