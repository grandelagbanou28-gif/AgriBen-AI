import 'package:flutter/material.dart';
import '../models/crop.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CropStatusCard extends StatelessWidget {
  final Crop crop;
  final VoidCallback? onTap;

  const CropStatusCard({
    super.key,
    required this.crop,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.paleGreen.withValues(alpha: 0.5)),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: crop.iconColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  _getCropEmoji(crop.name),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(crop.name, style: AppTextStyles.bodyLarge),
                  const SizedBox(height: 2),
                  Text(
                    crop.healthDescription,
                    style: AppTextStyles.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: crop.statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                crop.statusLabel,
                style: AppTextStyles.bodySmall.copyWith(
                  color: crop.statusColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCropEmoji(String name) {
    switch (name.toLowerCase()) {
      case 'maïs':
        return '🌽';
      case 'tomate':
        return '🍅';
      case 'soja':
        return '🫘';
      case 'ananas':
        return '🍍';
      case 'manioc':
        return '🌱';
      default:
        return '🌾';
    }
  }
}
