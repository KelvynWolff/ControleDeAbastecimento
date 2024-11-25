import 'package:flutter/material.dart';
import '../models/veiculo.dart';
import '../widgets/item_veiculo.dart';
import '../widgets/botao_adicionar_veiculo.dart';
import '../widgets/menu_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Veiculo> veiculos = [
      Veiculo(
          id: '1',
          nome: 'Carro A',
          modelo: 'SUV',
          ano: '2022',
          placa: 'ABC-1234'),
      Veiculo(
          id: '2',
          nome: 'Carro B',
          modelo: 'Sedan',
          ano: '2020',
          placa: 'XYZ-5678'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Veículos'),
        backgroundColor: const Color(0xFF007F3F),
      ),
      drawer: const MenuDrawer(),
      body: ListView.builder(
        itemCount: veiculos.length,
        itemBuilder: (context, index) {
          final veiculo = veiculos[index];
          return ItemVeiculo(
            veiculo: veiculo,
            aoClicar: () {
              Navigator.pushNamed(context, '/detalhes_veiculo',
                  arguments: veiculo);
            },
          );
        },
      ),
      floatingActionButton: BotaoAdicionarVeiculo(
        aoClicar: () {
          Navigator.pushNamed(context, '/adicionar_veiculo');
        },
      ),
    );
  }

  void fazerLogout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.pushReplacementNamed(context, '/login');
  }
}
