import 'package:flutter/material.dart';

class BotaoAdicionarVeiculo extends StatelessWidget {
  final VoidCallback aoClicar;

  const BotaoAdicionarVeiculo({
    Key? key,
    required this.aoClicar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: aoClicar,
      backgroundColor: const Color(0xFF007F3F),
      child: const Icon(Icons.add),
    );
  }
}
