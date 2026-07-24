import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../logos/logo_showcase.dart';
import 'brand_kit_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildProfileHeader(),
          const SizedBox(height: 24),
          _buildStatsSection(),
          const SizedBox(height: 24),
          _buildMenuSection(context),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: AppColors.forestGreen.withValues(alpha: 0.3),
                  blurRadius: 12,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'G',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text('Grandel K.', style: AppTextStyles.h2),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined, size: 14, color: AppColors.lightText),
              const SizedBox(width: 4),
              Text('Zè, Atlantique, Bénin', style: AppTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.forestGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Exploitation : 4 parcelles • 8.8 ha',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.forestGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Row(
      children: [
        Expanded(
          child: _buildStatItem('🌾', '5', 'Cultures'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatItem('📊', '3.2t', 'Rendement'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatItem('💰', '1.8M', 'FCFA'),
        ),
      ],
    );
  }

  Widget _buildStatItem(String emoji, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.darkText,
            ),
          ),
          Text(label, style: AppTextStyles.statLabel),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildMenuItem(
            Icons.landscape_outlined,
            'Mes parcelles',
            'Gérer vos terrains agricoles',
            AppColors.forestGreen,
          ),
          _buildDivider(),
          _buildMenuItem(
            Icons.palette_outlined,
            'Logo AgriBen',
            'Voir les propositions de logo',
            const Color(0xFF22C55E),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LogoShowcaseScreen()),
            ),
          ),
          _buildDivider(),
          _buildMenuItem(
            Icons.branding_watermark_outlined,
            'Brand Kit',
            'Identité visuelle complète',
            const Color(0xFFF59E0B),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const BrandKitScreen()),
            ),
          ),
          _buildDivider(),
          _buildMenuItem(
            Icons.history_rounded,
            'Historique',
            'Vos activités récentes',
            const Color(0xFF1565C0),
          ),
          _buildDivider(),
          _buildMenuItem(
            Icons.analytics_outlined,
            'Rapports',
            'Statistiques de production',
            AppColors.natureGreen,
          ),
          _buildDivider(),
          _buildMenuItem(
            Icons.notifications_outlined,
            'Notifications',
            'Gérer les alertes',
            AppColors.orangeAlert,
          ),
          _buildDivider(),
          _buildMenuItem(
            Icons.help_outline_rounded,
            'Aide & Support',
            'Questions fréquentes',
            const Color(0xFFAB47BC),
          ),
          _buildDivider(),
          _buildMenuItem(
            Icons.settings_outlined,
            'Paramètres',
            'Préférences et compte',
            AppColors.mediumText,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle, Color color, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyLarge.copyWith(fontSize: 15),
                  ),
                  Text(subtitle, style: AppTextStyles.caption),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.lightText,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      indent: 72,
      color: AppColors.divider,
    );
  }
}
