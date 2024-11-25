import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFF007F3F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Color(0xFF4F4F4F)),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: const TextStyle(color: Color(0xFF4F4F4F)),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007F3F),
                foregroundColor: Colors.white,
              ),
              child: const Text('Entrar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFFFC632),
              ),
              child: const Text('Não tem uma conta? Cadastre-se'),
            ),
          ],
        ),
      ),
    );
  }
}
