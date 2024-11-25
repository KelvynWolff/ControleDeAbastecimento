import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> fazerLogin(String email, String senha) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: senha.trim(),
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }

  Future<User?> cadastrarUsuario(String email, String senha) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: senha.trim(),
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Erro ao cadastrar usuário: $e');
    }
  }

  Future<void> enviarEmailRecuperacao(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } catch (e) {
      throw Exception('Erro ao enviar e-mail de recuperação: $e');
    }
  }

  Future<void> fazerLogout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Erro ao fazer logout: $e');
    }
  }

  User? verificarUsuarioLogado() {
    return _auth.currentUser;
  }
}
