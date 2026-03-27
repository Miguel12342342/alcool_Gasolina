import 'package:flutter/material.dart';

enum FuelResult { none, alcohol, gasoline }

// Álcool é vantajoso se seu preço for <= 70% do preço da gasolina.
// Carros flex têm ~70% da eficiência com álcool em relação à gasolina.
const double kAlcoholThreshold = 0.7;

// Tamanho de tanque padrão usado na estimativa de economia.
const double kTankLiters = 50.0;

class FuelProvider extends ChangeNotifier {
  double? _alcoholPrice;
  double? _gasolinePrice;

  FuelResult _result = FuelResult.none;
  double _ratio = 0.0;
  double _estimatedSavings = 0.0;
  bool _hasError = false;

  FuelResult get result => _result;
  double get ratio => _ratio;
  double get estimatedSavings => _estimatedSavings;
  bool get hasError => _hasError;

  void calculate(String alcoholText, String gasolineText) {
    _alcoholPrice = double.tryParse(alcoholText.replaceAll(',', '.'));
    _gasolinePrice = double.tryParse(gasolineText.replaceAll(',', '.'));

    final inputInvalid = _alcoholPrice == null ||
        _gasolinePrice == null ||
        _alcoholPrice! <= 0 ||
        _gasolinePrice! <= 0;

    if (inputInvalid) {
      _hasError = true;
      _result = FuelResult.none;
      _ratio = 0.0;
      _estimatedSavings = 0.0;
      notifyListeners();
      return;
    }

    _hasError = false;
    _ratio = _alcoholPrice! / _gasolinePrice!;
    _result = _ratio <= kAlcoholThreshold ? FuelResult.alcohol : FuelResult.gasoline;

    // Economia por tanque cheio: quanto custa percorrer a mesma distância
    // com cada combustível. Como álcool rende ~70% da gasolina, são
    // necessários (kTankLiters / kAlcoholThreshold) litros de álcool
    // para cobrir a mesma distância de kTankLiters litros de gasolina.
    if (_result == FuelResult.alcohol) {
      _estimatedSavings =
          (_gasolinePrice! * kTankLiters) -
          (_alcoholPrice! * kTankLiters / kAlcoholThreshold);
    } else {
      _estimatedSavings = 0.0;
    }

    notifyListeners();
  }

  void reset() {
    _alcoholPrice = null;
    _gasolinePrice = null;
    _result = FuelResult.none;
    _ratio = 0.0;
    _estimatedSavings = 0.0;
    _hasError = false;
    notifyListeners();
  }
}
