import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../models/diagnosis_result.dart';
import '../services/plant_diagnosis_service.dart';
import 'api_settings_dialog.dart';

class DiagnosticScreen extends StatefulWidget {
  const DiagnosticScreen({super.key});

  @override
  State<DiagnosticScreen> createState() => _DiagnosticScreenState();
}

class _DiagnosticScreenState extends State<DiagnosticScreen>
    with SingleTickerProviderStateMixin {
  bool _isScanning = false;
  bool _showResult = false;
  DiagnosisResult? _result;
  File? _imageFile;
  late AnimationController _scanController;
  final ImagePicker _picker = ImagePicker();

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

  Future<void> _takePicture() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (photo != null) {
      setState(() {
        _imageFile = File(photo.path);
      });
      _startDiagnosis();
    }
  }

  Future<void> _pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
      _startDiagnosis();
    }
  }

  void _startDiagnosis() async {
    if (_imageFile == null) return;

    setState(() {
      _isScanning = true;
      _showResult = false;
    });
    _scanController.repeat();

    try {
      final result = await PlantDiagnosisService.diagnose(_imageFile!);
      if (mounted) {
        setState(() {
          _result = result;
          _isScanning = false;
          _showResult = true;
        });
        _scanController.stop();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isScanning = false;
        });
        _scanController.stop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _reset() {
    setState(() {
      _showResult = false;
      _result = null;
      _imageFile = null;
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
        actions: [
          IconButton(
            icon: const Icon(Icons.vpn_key_outlined, size: 20),
            onPressed: () => _showApiKeyDialog(),
            tooltip: 'Clé API PlantNet',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: _showResult ? _buildResult() : _buildScanner(),
      ),
    );
  }

  void _showApiKeyDialog() {
    showDialog(
      context: context,
      builder: (_) => const ApiSettingsDialog(),
    );
  }

  Widget _buildScanner() {
    return Column(
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: _takePicture,
          child: Container(
            width: double.infinity,
            height: 320,
            decoration: BoxDecoration(
              color: AppColors.textPrimary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: _isScanning
                    ? AppColors.natureGreen
                    : AppColors.border,
                width: _isScanning ? 2 : 1,
              ),
            ),
            child: _imageFile != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.file(
                          _imageFile!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        if (_isScanning)
                          Container(
                            color: Colors.black.withValues(alpha: 0.4),
                            child: AnimatedBuilder(
                              animation: _scanController,
                              builder: (context, child) {
                                return Stack(
                                  children: [
                                    Positioned(
                                      top: 60 + (200 * _scanController.value),
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 2,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              AppColors.natureGreen,
                                              Colors.transparent,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
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
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.forestGreen.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: AppColors.forestGreen,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Appuyez pour photographier',
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'ou prenez une photo d\'une plante',
                            style: AppTextStyles.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: _isScanning ? null : _pickFromGallery,
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
                  onPressed: _isScanning ? null : _takePicture,
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
        const SizedBox(height: 32),
        Text(
          'Comment ça marche',
          style: AppTextStyles.h3,
        ),
        const SizedBox(height: 16),
        _buildStep(1, 'Photographiez', 'Prenez une photo nette de la plante ou de la feuille'),
        const SizedBox(height: 12),
        _buildStep(2, 'Analysez', 'L\'IA identifie l\'espèce et détecte les maladies'),
        const SizedBox(height: 12),
        _buildStep(3, 'Traitez', 'Recevez des conseils de traitement adaptés'),
      ],
    );
  }

  Widget _buildStep(int number, String title, String subtitle) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.forestGreen.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.forestGreen,
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.bodyLarge),
              Text(subtitle, style: AppTextStyles.bodySmall),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResult() {
    if (_result == null) return const SizedBox();

    final severityColor = _result!.severity == 'Élevé'
        ? AppColors.error
        : _result!.severity == 'Moyen'
            ? AppColors.warning
            : AppColors.success;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_imageFile != null)
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.forestGreen.withValues(alpha: 0.05),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(_imageFile!, fit: BoxFit.cover),
            ),
          ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: AppColors.subtleGradient,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                      child: Text('🌿', style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_result!.plantName, style: AppTextStyles.h2),
                        if (_result!.plantNameLatin.isNotEmpty)
                          Text(
                            _result!.plantNameLatin,
                            style: AppTextStyles.bodySmall.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_result!.diseaseName.isNotEmpty) ...[
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: severityColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: severityColor.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _result!.severity == 'Élevé'
                            ? Icons.warning_amber_rounded
                            : _result!.severity == 'Moyen'
                                ? Icons.info_outline
                                : Icons.check_circle_outline,
                        color: severityColor,
                        size: 22,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _result!.diseaseName,
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: severityColor,
                              ),
                            ),
                            Text(
                              'Sévérité: ${_result!.severity}',
                              style: AppTextStyles.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildInfoChip(
                    '${(_result!.confidence * 100).toStringAsFixed(0)}%',
                    Icons.precision_manufacturing_outlined,
                  ),
                  const SizedBox(width: 8),
                  _buildInfoChip(
                    _result!.healthStatus,
                    _result!.diseaseName.isEmpty
                        ? Icons.check_circle_outline
                        : Icons.monitor_heart_outlined,
                  ),
                  if (_result!.isFromApi) ...[
                    const SizedBox(width: 8),
                    _buildInfoChip('PlantNet', Icons.cloud_outlined),
                  ] else ...[
                    const SizedBox(width: 8),
                    _buildInfoChip('Mode démo', Icons.science_outlined),
                  ],
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        if (_result!.description.isNotEmpty) ...[
          Text('Description', style: AppTextStyles.h3),
          const SizedBox(height: 8),
          Text(_result!.description, style: AppTextStyles.body),
          const SizedBox(height: 20),
        ],
        if (_result!.symptoms.isNotEmpty) ...[
          Text('Symptômes', style: AppTextStyles.h3),
          const SizedBox(height: 10),
          ..._result!.symptoms.map(
            (s) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.circle, size: 6, color: AppColors.warning),
                  const SizedBox(width: 10),
                  Expanded(child: Text(s, style: AppTextStyles.body)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        if (_result!.treatments.isNotEmpty) ...[
          Text('Traitements recommandés', style: AppTextStyles.h3),
          const SizedBox(height: 10),
          ..._result!.treatments.map(
            (t) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.healing_outlined, size: 18, color: AppColors.natureGreen),
                  const SizedBox(width: 10),
                  Expanded(child: Text(t, style: AppTextStyles.body)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        if (_result!.preventionTips.isNotEmpty) ...[
          Text('Prévention', style: AppTextStyles.h3),
          const SizedBox(height: 10),
          ..._result!.preventionTips.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.shield_outlined, size: 18, color: AppColors.forestGreen),
                  const SizedBox(width: 10),
                  Expanded(child: Text(p, style: AppTextStyles.body)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: _reset,
            child: const Text('Nouveau diagnostic'),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.forestGreen.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.forestGreen),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.forestGreen,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
