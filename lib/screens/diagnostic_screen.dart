import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class DiagnosticScreen extends StatefulWidget {
  const DiagnosticScreen({super.key});

  @override
  State<DiagnosticScreen> createState() => _DiagnosticScreenState();
}

class _DiagnosticScreenState extends State<DiagnosticScreen>
    with SingleTickerProviderStateMixin {
  bool _isScanning = false;
  bool _showResult = false;
  late AnimationController _scanController;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _scanController.dispose();
    super.dispose();
  }

  void _startScan() {
    setState(() {
      _isScanning = true;
      _showResult = false;
    });
    _scanController.repeat();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isScanning = false;
          _showResult = true;
        });
        _scanController.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Diagnostic'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: _showResult ? _buildResult() : _buildScanner(),
      ),
    );
  }

  Widget _buildScanner() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 320,
          decoration: BoxDecoration(
            color: AppColors.darkText.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: _isScanning
                  ? AppColors.natureGreen
                  : AppColors.paleGreen,
              width: _isScanning ? 2 : 1,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.natureGreen.withValues(alpha: 0.5),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: AppColors.natureGreen,
                              width: 3,
                            ),
                            left: BorderSide(
                              color: AppColors.natureGreen,
                              width: 3,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: AppColors.natureGreen,
                              width: 3,
                            ),
                            right: BorderSide(
                              color: AppColors.natureGreen,
                              width: 3,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.natureGreen,
                              width: 3,
                            ),
                            left: BorderSide(
                              color: AppColors.natureGreen,
                              width: 3,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.natureGreen,
                              width: 3,
                            ),
                            right: BorderSide(
                              color: AppColors.natureGreen,
                              width: 3,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_isScanning)
                AnimatedBuilder(
                  animation: _scanController,
                  builder: (context, child) {
                    return Positioned(
                      top: 60 + (200 * _scanController.value),
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              AppColors.natureGreen,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              if (!_isScanning)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.center_focus_strong,
                      size: 48,
                      color: AppColors.lightText.withValues(alpha: 0.5),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Cadre de scan',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.lightText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Placez la plante au centre',
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              if (_isScanning)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Analyse en cours...',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Analyse de plante',
          style: AppTextStyles.h2,
        ),
        const SizedBox(height: 8),
        Text(
          'Prenez une photo de la plante ou sélectionnez depuis votre galerie pour diagnostiquer l\'état de santé.',
          textAlign: TextAlign.center,
          style: AppTextStyles.body.copyWith(
            color: AppColors.mediumText,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: () => _startScan(),
                  icon: const Icon(Icons.photo_library_outlined, size: 20),
                  label: const Text('Galerie'),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _isScanning ? null : () => _startScan(),
                  icon: _isScanning
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.camera_alt_outlined, size: 20),
                  label: Text(_isScanning ? 'Analyse...' : 'Prendre photo'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildResult() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: AppColors.lightGradient,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text('🍅', style: TextStyle(fontSize: 40)),
                ),
              ),
              const SizedBox(height: 16),
              Text('Tomate', style: AppTextStyles.h2),
              const SizedBox(height: 4),
              Text(
                'Variété Roma VF',
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.orangeAlert.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.orangeAlert.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.orangeAlert.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.orangeAlert,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Niveau de risque : Moyen',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.orangeAlert,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Feuille légèrement infectée',
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildResultSection(
          'Analyse',
          'Des taches brunes sont visibles sur certaines feuilles. Cela peut indiquer une détection précoce d\'un champignon (alternaria ou septoriose). L\'infection est au stade initial.',
          Icons.search,
          AppColors.natureGreen,
        ),
        const SizedBox(height: 12),
        _buildResultSection(
          'Conseils pratiques',
          '• Retirez les feuilles touchées\n• Évitez l\'arrosage par aspersion\n• Aérez bien les rangs de culture\n• Surveillez l\'évolution sur 3-5 jours',
          Icons.lightbulb_outline,
          AppColors.forestGreen,
        ),
        const SizedBox(height: 12),
        _buildResultSection(
          'Traitement recommandé',
          '• Bouillie bordelaise (20g/L d\'eau)\n• Poudre de concombre amer en pulvérisation\n• En cas de persistance : traitement chimique à base de cuivre',
          Icons.healing_outlined,
          const Color(0xFF1565C0),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _showResult = false;
              });
            },
            child: const Text('Nouveau diagnostic'),
          ),
        ),
      ],
    );
  }

  Widget _buildResultSection(
    String title,
    String content,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: AppTextStyles.body.copyWith(
              color: AppColors.mediumText,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
