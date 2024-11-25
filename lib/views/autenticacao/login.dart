import 'package:flutter/material.dart';
import '../../controllers/autenticacao_controller.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final AutenticacaoController _authController = AutenticacaoController();
  bool lembrarDeMim = false;

  void fazerLogin() async {
    try {
      final user = await _authController.fazerLogin(
        emailController.text,
        senhaController.text,
      );

      if (user != null && mounted) {
        if (lembrarDeMim) {}
        Navigator.pushReplacementNamed(context, '/home');
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Color(0xFFFFFF00),
          ),
        ),
        backgroundColor: const Color(0xFF007F3F),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height - AppBar().preferredSize.height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Bem-vindo! Ao controle de combustivel da Petrobras',
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF007F3F),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: lembrarDeMim,
                        onChanged: (value) {
                          setState(() {
                            lembrarDeMim = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        'Lembrar de mim',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reset_senha');
                    },
                    child: const Text(
                      'Esqueci a senha',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF007F3F),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: size.width * 0.9,
                height: 50,
                child: ElevatedButton(
                  onPressed: fazerLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007F3F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFFFF00),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ainda não tem conta?',
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cadastro');
                    },
                    child: const Text(
                      'Cadastrar-se',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF007F3F),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
