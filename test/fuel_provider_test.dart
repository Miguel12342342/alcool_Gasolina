import 'package:app3_alcool_gasolina/providers/fuel_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FuelProvider provider;

  setUp(() {
    provider = FuelProvider();
  });

  group('FuelProvider.calculate — recomendação de combustível', () {
    test('recomenda álcool quando razão <= 0.7', () {
      provider.calculate('3.50', '5.00'); // razão = 0.70
      expect(provider.result, FuelResult.alcohol);
      expect(provider.hasError, false);
    });

    test('recomenda álcool quando razão < 0.7', () {
      provider.calculate('3.00', '5.00'); // razão = 0.60
      expect(provider.result, FuelResult.alcohol);
    });

    test('recomenda gasolina quando razão > 0.7', () {
      provider.calculate('4.00', '5.00'); // razão = 0.80
      expect(provider.result, FuelResult.gasoline);
      expect(provider.hasError, false);
    });

    test('calcula razão corretamente', () {
      provider.calculate('3.50', '5.00');
      expect(provider.ratio, closeTo(0.70, 0.001));
    });
  });

  group('FuelProvider.calculate — economia estimada', () {
    test('economia positiva quando álcool é recomendado', () {
      provider.calculate('3.00', '5.00'); // razão 0.6 — álcool
      // custo gasolina 50L = 250. custo álcool 50/0.7 ≈ 71.4L * 3.0 ≈ 214.3. economia ≈ 35.7
      expect(provider.estimatedSavings, greaterThan(0));
    });

    test('economia zero quando gasolina é recomendada', () {
      provider.calculate('4.00', '5.00'); // razão 0.8 — gasolina
      expect(provider.estimatedSavings, 0.0);
    });

    test('fórmula de economia correta (50L de tanque)', () {
      const alcoholPrice = 3.0;
      const gasolinePrice = 5.0;
      provider.calculate('$alcoholPrice', '$gasolinePrice');

      final expected =
          (gasolinePrice * kTankLiters) - (alcoholPrice * kTankLiters / kAlcoholThreshold);
      expect(provider.estimatedSavings, closeTo(expected, 0.001));
    });
  });

  group('FuelProvider.calculate — entradas inválidas', () {
    test('texto vazio define hasError=true e result=none', () {
      provider.calculate('', '');
      expect(provider.hasError, true);
      expect(provider.result, FuelResult.none);
    });

    test('texto não numérico define hasError=true', () {
      provider.calculate('abc', '5.00');
      expect(provider.hasError, true);
    });

    test('preço zero define hasError=true', () {
      provider.calculate('0', '5.00');
      expect(provider.hasError, true);
    });

    test('preço negativo define hasError=true', () {
      provider.calculate('-1.5', '5.00');
      expect(provider.hasError, true);
    });

    test('aceita vírgula como separador decimal', () {
      provider.calculate('3,50', '5,00');
      expect(provider.hasError, false);
      expect(provider.ratio, closeTo(0.70, 0.001));
    });
  });

  group('FuelProvider.reset', () {
    test('volta ao estado inicial após reset', () {
      provider.calculate('3.00', '5.00');
      provider.reset();

      expect(provider.result, FuelResult.none);
      expect(provider.ratio, 0.0);
      expect(provider.estimatedSavings, 0.0);
      expect(provider.hasError, false);
    });
  });
}
