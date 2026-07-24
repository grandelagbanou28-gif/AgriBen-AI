import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../logos/agriben_icon.dart';
import '../logos/logo_showcase.dart';

class BrandKitScreen extends StatelessWidget {
  const BrandKitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF5),
      appBar: AppBar(
        title: const Text('AgriBen Brand Kit'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const LogoShowcaseScreen()),
              );
            },
            child: Text(
              'Voir logos',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.forestGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Identité visuelle', style: AppTextStyles.h1),
            const SizedBox(height: 8),
            Text(
              'Palette de couleurs officielle et guidelines',
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.mediumText),
            ),
            const SizedBox(height: 24),
            _buildIconSection(),
            const SizedBox(height: 24),
            _buildColorSection(),
            const SizedBox(height: 24),
            _buildTypographySection(),
            const SizedBox(height: 24),
            _buildSpacingSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildIconSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Icône', style: AppTextStyles.h3),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                const AgriBenIcon(size: 120, showShadow: true),
                const SizedBox(height: 16),
                Text(
                  'AgriBen',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'L\'agriculture connectée du Bénin',
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.mediumText),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconSize('48px', 48),
              _buildIconSize('72px', 72),
              _buildIconSize('96px', 96),
              _buildIconSize('128px', 128),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconSize(String label, double size) {
    return Column(
      children: [
        AgriBenIcon(size: size, showShadow: false),
        const SizedBox(height: 8),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }

  Widget _buildColorSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Couleurs', style: AppTextStyles.h3),
          const SizedBox(height: 16),
          _buildColorItem(const Color(0xFF14532D), 'Vert Forêt', '#14532D', 'Confiance, agriculture'),
          _buildColorItem(const Color(0xFF22C55E), 'Vert Nature', '#22C55E', 'Croissance, vitalité'),
          _buildColorItem(const Color(0xFFD6C3A5), 'Beige Terre', '#D6C3A5', 'Sol, authenticité'),
          _buildColorItem(const Color(0xFFF59E0B), 'Or Réussite', '#F59E0B', 'Valeur, réussite'),
          _buildColorItem(Colors.white, 'Blanc', '#FFFFFF', 'Simplicité, espace'),
        ],
      ),
    );
  }

  Widget _buildColorItem(Color color, String name, String hex, String meaning) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              border: color == Colors.white
                  ? Border.all(color: Colors.grey.withValues(alpha: 0.2))
                  : null,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.2),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.bodyLarge.copyWith(fontSize: 14)),
                Text('$hex • $meaning', style: AppTextStyles.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypographySection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Typographie', style: AppTextStyles.h3),
          const SizedBox(height: 16),
          Text('Poppins', style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.darkText)),
          const SizedBox(height: 8),
          Text('ABCDEFGHIJKLMNOPQRSTUVWXYZ', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.mediumText)),
          Text('abcdefghijklmnopqrstuvwxyz', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.mediumText)),
          Text('0123456789 FCFA', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.mediumText)),
          const SizedBox(height: 12),
          _buildTypoWeight('Bold 700', FontWeight.w700),
          _buildTypoWeight('SemiBold 600', FontWeight.w600),
          _buildTypoWeight('Medium 500', FontWeight.w500),
          _buildTypoWeight('Regular 400', FontWeight.w400),
        ],
      ),
    );
  }

  Widget _buildTypoWeight(String label, FontWeight weight) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: AppTextStyles.caption),
          ),
          Text(
            'AgriBen - Agriculture',
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: weight, color: AppColors.darkText),
          ),
        ],
      ),
    );
  }

  Widget _buildSpacingSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Espacement', style: AppTextStyles.h3),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildSpacingDemo('4px', 4),
              const SizedBox(width: 12),
              _buildSpacingDemo('8px', 8),
              const SizedBox(width: 12),
              _buildSpacingDemo('12px', 12),
              const SizedBox(width: 12),
              _buildSpacingDemo('16px', 16),
              const SizedBox(width: 12),
              _buildSpacingDemo('24px', 24),
            ],
          ),
          const SizedBox(height: 16),
          Text('Border Radius', style: AppTextStyles.bodyLarge.copyWith(fontSize: 14)),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildRadiusDemo(8),
              const SizedBox(width: 12),
              _buildRadiusDemo(12),
              const SizedBox(width: 12),
              _buildRadiusDemo(16),
              const SizedBox(width: 12),
              _buildRadiusDemo(20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpacingDemo(String label, double size) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.natureGreen.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }

  Widget _buildRadiusDemo(double radius) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.forestGreen.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        const SizedBox(height: 4),
        Text(radius.toStringAsFixed(0), style: AppTextStyles.caption),
      ],
    );
  }
}
