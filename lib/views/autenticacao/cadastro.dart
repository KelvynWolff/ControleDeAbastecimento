import 'package:flutter/material.dart';
import '../../controllers/autenticacao_controller.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();
  final AutenticacaoController _authController = AutenticacaoController();

  void fazerCadastro() async {
    if (senhaController.text != confirmarSenhaController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('As senhas não coincidem')),
      );
      return;
    }

    try {
      final user = await _authController.cadastrarUsuario(
        emailController.text,
        senhaController.text,
      );

      if (user != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso!')),
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
        title: const Text('Cadastro'),
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
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: confirmarSenhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirmar Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: fazerCadastro,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007F3F),
              ),
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
