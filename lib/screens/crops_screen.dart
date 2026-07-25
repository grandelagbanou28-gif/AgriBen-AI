import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../models/crop.dart';
import '../widgets/crop_status_card.dart';
import 'diagnostic_screen.dart';

class CropsScreen extends StatelessWidget {
  const CropsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mes cultures', style: AppTextStyles.h1),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.forestGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: Colors.white, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        'Ajouter',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '4 parcelles • 8.8 hectares',
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 20),
          _buildSummaryRow(),
          const SizedBox(height: 24),
          Text('Toutes les cultures', style: AppTextStyles.h3),
          const SizedBox(height: 12),
          ...Crop.samples.map(
            (crop) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CropStatusCard(
                crop: crop,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const DiagnosticScreen()),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildSummaryRow() {
    return Row(
      children: [
        _buildSummaryChip('Excellent', 2, AppColors.success),
        const SizedBox(width: 8),
        _buildSummaryChip('Bonne santé', 2, AppColors.natureGreen),
        const SizedBox(width: 8),
        _buildSummaryChip('Attention', 1, AppColors.warning),
      ],
    );
  }

  Widget _buildSummaryChip(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
