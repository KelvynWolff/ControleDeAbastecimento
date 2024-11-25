import 'package:flutter/material.dart';
import '../models/veiculo.dart';

class ItemVeiculo extends StatelessWidget {
  final Veiculo veiculo;
  final VoidCallback aoClicar;

  const ItemVeiculo({
    Key? key,
    required this.veiculo,
    required this.aoClicar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(veiculo.nome),
      subtitle: Text('${veiculo.modelo} - ${veiculo.ano}'),
      trailing: Text(veiculo.placa),
      onTap: aoClicar,
    );
  }
}
