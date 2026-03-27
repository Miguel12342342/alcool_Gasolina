import 'package:app3_alcool_gasolina/pages/home_page.dart';
import 'package:app3_alcool_gasolina/providers/fuel_provider.dart';
import 'package:app3_alcool_gasolina/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FuelProvider()),
      ],
      child: const FuelWiseApp(),
    ),
  );
}

class FuelWiseApp extends StatelessWidget {
  const FuelWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FuelWise',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}