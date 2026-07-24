import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class QuickActions extends StatelessWidget {
  final VoidCallback? onScan;
  final VoidCallback? onAddCrop;
  final VoidCallback? onMarket;
  final VoidCallback? onAdvice;

  const QuickActions({
    super.key,
    this.onScan,
    this.onAddCrop,
    this.onMarket,
    this.onAdvice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Actions rapides', style: AppTextStyles.h3),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ActionButton(
              icon: Icons.document_scanner_outlined,
              label: 'Scanner',
              color: AppColors.natureGreen,
              onTap: onScan,
            ),
            _ActionButton(
              icon: Icons.add_circle_outline,
              label: 'Ajouter',
              color: AppColors.forestGreen,
              onTap: onAddCrop,
            ),
            _ActionButton(
              icon: Icons.storefront_outlined,
              label: 'Marché',
              color: AppColors.orangeAlert,
              onTap: onMarket,
            ),
            _ActionButton(
              icon: Icons.chat_bubble_outline,
              label: 'Conseil',
              color: const Color(0xFF1565C0),
              onTap: onAdvice,
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }
}
