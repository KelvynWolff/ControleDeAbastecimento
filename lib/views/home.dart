import 'package:flutter/material.dart';
import '../models/Veiculo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Vehicle> vehicles = [
      Vehicle(
          id: '1', name: 'SW4', model: 'SUV', year: '2022', placa: 'ABC-1234'),
      Vehicle(
          id: '2',
          name: 'KA+',
          model: 'Sedan',
          year: '2020',
          placa: 'XYZ-5678'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Veículos'),
        backgroundColor: const Color(0xFF007F3F),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF007F3F)),
              child: Text('Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Adicionar Veículo'),
              onTap: () {
                Navigator.pushNamed(context, '/add_vehicle');
              },
            ),
            ListTile(
              title: const Text('Histórico de Abastecimentos'),
              onTap: () {
                Navigator.pushNamed(context, '/fuel_history');
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return ListTile(
            title: Text(vehicle.name),
            subtitle: Text('${vehicle.model} - ${vehicle.year}'),
            trailing: Text(vehicle.placa),
            onTap: () {
              Navigator.pushNamed(context, '/vehicle_details',
                  arguments: vehicle);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_vehicle');
        },
        backgroundColor: const Color(0xFF007F3F),
        child: const Icon(Icons.add),
      ),
    );
  }
}
