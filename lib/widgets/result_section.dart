import 'package:app3_alcool_gasolina/providers/fuel_provider.dart';
import 'package:app3_alcool_gasolina/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ResultSection extends StatelessWidget {
  const ResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FuelProvider>();

    if (provider.result == FuelResult.none) {
      return const SizedBox.shrink();
    }

    final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryStart.withValues(alpha:0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: AppColors.primaryStart,
                  size: 32,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'RECOMENDAÇÃO',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Abasteça com\n${provider.result == FuelResult.alcohol ? "Álcool" : "Gasolina"}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Razão de Preço',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${(provider.ratio * 100).toStringAsFixed(1)}%',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primaryStart,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Container(
                        height: 12,
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          color: AppColors.progressBarBase,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      Container(
                        height: 12,
                        width: constraints.maxWidth * (provider.ratio.clamp(0.0, 1.0)),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      // 70% marker
                      Positioned(
                        left: constraints.maxWidth * 0.7 - 1,
                        child: Container(
                          width: 2,
                          height: 12,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ETANOL', style: Theme.of(context).textTheme.labelLarge),
                  Text('LIMITE 70%', style: Theme.of(context).textTheme.labelLarge),
                  Text('GASOLINA', style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
            ],
          ),
        ),
        if (provider.estimatedSavings > 0)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.savingsCardBackground,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.primaryEnd.withValues(alpha:0.2)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryEnd,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.savings, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ECONOMIA ESTIMADA',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.primaryStart,
                            ),
                      ),
                      Text(
                        '${currencyFormat.format(provider.estimatedSavings)} /tanque',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.trending_up, color: AppColors.primaryStart),
              ],
            ),
          ),
      ],
    );
  }
}
