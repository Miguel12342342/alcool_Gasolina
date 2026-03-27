import 'package:app3_alcool_gasolina/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback onReset;

  const CustomHeader({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.local_gas_station, color: AppColors.primaryStart, size: 28),
              const SizedBox(width: 8),
              Text(
                'FuelWise',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.primaryStart,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Tooltip(
            message: 'Limpar campos',
            child: IconButton(
              onPressed: onReset,
              icon: const Icon(Icons.refresh_rounded, color: AppColors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
