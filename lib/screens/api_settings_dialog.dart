import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../services/plant_diagnosis_service.dart';

class ApiSettingsDialog extends StatefulWidget {
  const ApiSettingsDialog({super.key});

  @override
  State<ApiSettingsDialog> createState() => _ApiSettingsDialogState();
}

class _ApiSettingsDialogState extends State<ApiSettingsDialog> {
  final TextEditingController _controller = TextEditingController();
  bool _hasKey = false;

  @override
  void initState() {
    super.initState();
    _loadApiKey();
  }

  Future<void> _loadApiKey() async {
    final key = await PlantDiagnosisService.getApiKey();
    if (key != null && key.isNotEmpty) {
      setState(() {
        _controller.text = key;
        _hasKey = true;
      });
    }
  }

  Future<void> _saveApiKey() async {
    final key = _controller.text.trim();
    await PlantDiagnosisService.setApiKey(key);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            key.isNotEmpty
                ? 'Clé API enregistrée'
                : 'Clé API supprimée',
          ),
          backgroundColor: AppColors.forestGreen,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.forestGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.vpn_key_outlined, color: AppColors.forestGreen),
          ),
          const SizedBox(width: 12),
          Text('API PlantNet', style: AppTextStyles.h3),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Obtenez une clé gratuite sur plantnet.org',
            style: AppTextStyles.bodySmall,
          ),
          const SizedBox(height: 4),
          Text(
            '500 requêtes/jour • Gratuit',
            style: AppTextStyles.caption.copyWith(color: AppColors.natureGreen),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Votre clé API...',
              suffixIcon: _hasKey
                  ? const Icon(Icons.check_circle, color: AppColors.natureGreen, size: 20)
                  : null,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Sans clé, le diagnostic utilise des données de démonstration.',
            style: AppTextStyles.caption,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Annuler', style: AppTextStyles.bodySmall),
        ),
        ElevatedButton(
          onPressed: _saveApiKey,
          child: const Text('Enregistrer'),
        ),
      ],
    );
  }
}
