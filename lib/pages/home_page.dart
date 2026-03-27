import 'package:app3_alcool_gasolina/providers/fuel_provider.dart';
import 'package:app3_alcool_gasolina/widgets/calculate_button.dart';
import 'package:app3_alcool_gasolina/widgets/custom_header.dart';
import 'package:app3_alcool_gasolina/widgets/fuel_input_card.dart';
import 'package:app3_alcool_gasolina/widgets/hero_banner.dart';
import 'package:app3_alcool_gasolina/widgets/result_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _gasolineController = TextEditingController();
  final TextEditingController _ethanolController = TextEditingController();
  FuelProvider? _fuelProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_fuelProvider == null) {
      _fuelProvider = context.read<FuelProvider>();
      _fuelProvider!.addListener(_onProviderChanged);
    }
  }

  void _onProviderChanged() {
    if (_fuelProvider!.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Insira preços válidos maiores que zero.'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void _reset() {
    _fuelProvider!.reset();
    _gasolineController.clear();
    _ethanolController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _fuelProvider?.removeListener(_onProviderChanged);
    _gasolineController.dispose();
    _ethanolController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomHeader(onReset: _reset),
              const HeroBanner(),
              FuelInputCard(
                fuelType: 'GASOLINA',
                controller: _gasolineController,
                icon: Icons.local_gas_station,
                iconColor: Colors.blueAccent,
              ),
              FuelInputCard(
                fuelType: 'ÁLCOOL / ETANOL',
                controller: _ethanolController,
                icon: Icons.eco,
                iconColor: Colors.greenAccent,
              ),
              CalculateButton(
                onPressed: () {
                  context.read<FuelProvider>().calculate(
                    _ethanolController.text,
                    _gasolineController.text,
                  );
                },
              ),
              const ResultSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
